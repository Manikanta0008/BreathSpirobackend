from django.shortcuts import render, get_object_or_404, redirect
from django.db.models import Sum, Avg
from api.models import UserProfile, TrainingSession

# Color palette for avatars
AVATAR_COLORS = [
    'linear-gradient(135deg, #3b82f6, #1d4ed8)',
    'linear-gradient(135deg, #10b981, #059669)',
    'linear-gradient(135deg, #8b5cf6, #6d28d9)',
    'linear-gradient(135deg, #f59e0b, #d97706)',
    'linear-gradient(135deg, #ef4444, #dc2626)',
    'linear-gradient(135deg, #ec4899, #be185d)',
    'linear-gradient(135deg, #06b6d4, #0891b2)',
]


def _add_avatar_colors(users):
    for i, user in enumerate(users):
        user.avatar_color = AVATAR_COLORS[i % len(AVATAR_COLORS)]
    return users


def _is_logged_in(request):
    return request.session.get('is_logged_in', False)


def _get_username(request):
    return request.session.get('logged_in_user', '')


def _ctx(request, page=''):
    return {'username': _get_username(request), 'page': page}


# ===================== AUTH =====================

def _get_next_setup_step(user):
    """Check which setup step the user needs to complete next, like the app."""
    if not user.age or user.age == 0:
        return 'web-profile-setup'
    if not user.condition:
        return 'web-diagnosis'
    if not user.smoking_status:
        return 'web-smoking'
    if not user.respiratory_rate or user.respiratory_rate == 0:
        return 'web-respiratory-rate'
    if not user.spo2_level or user.spo2_level == 0:
        return 'web-spo2'
    if not user.dyspnea_score and user.dyspnea_score != 0:
        return 'web-dyspnea'
    if not user.mip_value or user.mip_value == 0:
        return 'web-muscle-strength'
    if not user.baseline_hold_time_sec or user.baseline_hold_time_sec == 0:
        return 'web-baseline'
    return None  # Profile complete


def web_login(request):
    if _is_logged_in(request):
        return redirect('web-home')

    if request.method == 'POST':
        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '').strip()
        try:
            user = UserProfile.objects.get(username=username)
            if user.password == password:
                request.session['is_logged_in'] = True
                request.session['logged_in_user'] = username
                # Check if profile setup is complete
                next_step = _get_next_setup_step(user)
                if next_step:
                    return redirect(next_step)
                return redirect('web-home')
            else:
                return render(request, 'login.html', {'error': 'Invalid password.', 'username': username})
        except UserProfile.DoesNotExist:
            return render(request, 'login.html', {'error': 'Username not found. Register via the app or below.', 'username': username})

    return render(request, 'login.html', {})


def web_register(request):
    if request.method == 'POST':
        full_name = request.POST.get('full_name', '').strip()
        username = request.POST.get('username', '').strip()
        password = request.POST.get('password', '').strip()

        if not username or not password:
            return render(request, 'register.html', {'error': 'Username and password are required.', 'username': username})
        if len(password) < 6:
            return render(request, 'register.html', {'error': 'Password must be at least 6 characters.', 'username': username})
        if UserProfile.objects.filter(username=username).exists():
            return render(request, 'register.html', {'error': 'Username already taken.', 'username': username})

        UserProfile.objects.create(username=username, password=password, name=full_name, device_id='web_' + username)
        return render(request, 'login.html', {'username': username, 'success': 'Account created! Please login.'})

    return render(request, 'register.html', {})


def web_forgot_password(request):
    if request.method == 'POST':
        username = request.POST.get('username', '').strip()
        new_password = request.POST.get('new_password', '').strip()
        confirm_password = request.POST.get('confirm_password', '').strip()

        if not username or not new_password:
            return render(request, 'forgot_password.html', {'error': 'All fields are required.', 'username': username})
        if new_password != confirm_password:
            return render(request, 'forgot_password.html', {'error': 'Passwords do not match.', 'username': username})
        if len(new_password) < 6:
            return render(request, 'forgot_password.html', {'error': 'Password must be at least 6 characters.', 'username': username})

        try:
            user = UserProfile.objects.get(username=username)
            user.password = new_password
            user.save()
            return render(request, 'login.html', {'success': 'Password reset successfully! Please login with your new password.', 'username': username})
        except UserProfile.DoesNotExist:
            return render(request, 'forgot_password.html', {'error': 'Username not found.', 'username': username})

    return render(request, 'forgot_password.html', {})


def web_logout(request):
    request.session.flush()
    return redirect('web-login')


# ===================== PROFILE SETUP =====================

def web_profile_setup(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.name = request.POST.get('name', '')
        profile.age = int(request.POST.get('age', 0) or 0)
        profile.gender = request.POST.get('gender', '')
        profile.height = float(request.POST.get('height', 0) or 0)
        profile.weight = float(request.POST.get('weight', 0) or 0)
        profile.save()
        return redirect('web-diagnosis')

    return render(request, 'profile_setup.html', ctx)


def web_diagnosis(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.condition = request.POST.get('condition', '')
        profile.save()
        return redirect('web-smoking')

    return render(request, 'diagnosis.html', ctx)


def web_smoking(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.smoking_status = request.POST.get('smoking_status', '')
        profile.pack_years = int(request.POST.get('pack_years', 0) or 0)
        profile.save()
        return redirect('web-respiratory-rate')

    return render(request, 'smoking.html', ctx)


def web_respiratory_rate(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.respiratory_rate = int(request.POST.get('respiratory_rate', 0) or 0)
        profile.save()
        return redirect('web-spo2')

    return render(request, 'respiratory_rate.html', ctx)


def web_spo2(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.spo2_level = int(request.POST.get('spo2_level', 0) or 0)
        profile.save()
        return redirect('web-dyspnea')

    return render(request, 'spo2.html', ctx)


def web_dyspnea(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.dyspnea_score = int(request.POST.get('dyspnea_score', 0) or 0)
        profile.dyspnea_description = request.POST.get('dyspnea_description', '')
        profile.save()
        return redirect('web-muscle-strength')

    return render(request, 'dyspnea.html', ctx)


def web_muscle_strength(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.mip_value = float(request.POST.get('mip_value', 0) or 0)
        profile.mep_value = float(request.POST.get('mep_value', 0) or 0)
        profile.muscle_strength_level = request.POST.get('muscle_strength_level', '')
        profile.save()
        return redirect('web-baseline')

    return render(request, 'muscle_strength.html', ctx)


def web_baseline(request):
    if not _is_logged_in(request):
        return redirect('web-login')
    ctx = _ctx(request)

    if request.method == 'POST':
        profile = UserProfile.objects.get(username=_get_username(request))
        profile.baseline_hold_time_sec = int(request.POST.get('baseline_hold_time_sec', 0) or 0)
        profile.save()
        return redirect('web-home')

    return render(request, 'baseline.html', ctx)


# ===================== MAIN FEATURES =====================

def web_home(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    username = _get_username(request)
    user_sessions = TrainingSession.objects.filter(username=username).order_by('-created_at')

    total_cycles = user_sessions.aggregate(total=Sum('completed_cycles'))['total'] or 0
    total_breaths = user_sessions.aggregate(total=Sum('breath_count'))['total'] or 0
    avg_duration = user_sessions.aggregate(avg=Avg('session_duration_sec'))['avg'] or 0
    avg_volume = round(total_breaths * 0.5 / max(user_sessions.count(), 1), 1)

    ctx = _ctx(request, 'home')
    ctx.update({
        'total_sessions': user_sessions.count(),
        'total_cycles': total_cycles,
        'total_breaths': total_breaths,
        'avg_duration': int(avg_duration),
        'avg_volume': avg_volume,
        'recent_sessions': user_sessions[:5],
    })
    return render(request, 'home.html', ctx)


def web_breathing(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    username = _get_username(request)

    if request.method == 'POST':
        cycles = int(request.POST.get('completed_cycles', 0))
        total = int(request.POST.get('total_cycles', 10))
        duration = int(request.POST.get('session_duration_sec', 0))
        breaths = int(request.POST.get('breath_count', 0))

        TrainingSession.objects.create(
            device_id='web_' + username,
            username=username,
            completed_cycles=cycles,
            total_cycles=total,
            session_duration_sec=duration,
            breath_count=breaths,
        )

        score = int(cycles * 100 / total) if total > 0 else 0
        dur_min = duration // 60
        dur_sec = str(duration % 60).zfill(2)
        volume = round(breaths * 0.5, 1)

        return render(request, 'web_session_summary.html', {
            **_ctx(request, 'breathing'),
            'score': score, 'cycles': cycles, 'total_cycles': total,
            'duration': duration, 'duration_min': dur_min, 'duration_sec': dur_sec,
            'breaths': breaths, 'volume': volume,
        })

    return render(request, 'guided_breathing.html', _ctx(request, 'breathing'))


def web_performance(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    cycles = int(request.GET.get('cycles', 0))
    total = int(request.GET.get('total', 10))
    duration = int(request.GET.get('dur', 0))
    breaths = int(request.GET.get('breaths', 0))

    completion = int(cycles * 100 / total) if total > 0 else 0
    expected_dur = cycles * 12
    dur_score = 0
    if expected_dur > 0 and duration > 0:
        ratio = duration / expected_dur
        if 0.9 <= ratio <= 1.2: dur_score = 95
        elif 0.7 <= ratio <= 1.5: dur_score = 80
        elif ratio >= 0.5: dur_score = 65
        else: dur_score = 40

    m1 = min(100, completion + 5)
    m2 = max(0, min(100, dur_score if dur_score > 0 else completion - 10))
    m3 = min(100, completion + 10)
    m4 = max(0, min(100, (completion + (dur_score if dur_score > 0 else completion)) // 2))
    expected_breaths = total * 3
    m5 = max(0, min(100, int(breaths * 100 / expected_breaths))) if expected_breaths > 0 else 0

    if completion >= 90:
        rec = f"Excellent session! You completed {cycles}/{total} cycles with great consistency."
    elif completion >= 70:
        rec = f"Good effort! You completed {cycles}/{total} cycles. Try to complete all next time."
    elif completion >= 50:
        rec = f"You completed {cycles}/{total} cycles. Focus on steady rhythm for more cycles."
    else:
        rec = f"You completed {cycles}/{total} cycles. Start with shorter sessions and build up."

    return render(request, 'web_performance.html', {
        **_ctx(request), 'm1': m1, 'm2': m2, 'm3': m3, 'm4': m4, 'm5': m5,
        'recommendation': rec,
    })


def web_history(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    username = _get_username(request)
    user_sessions = TrainingSession.objects.filter(username=username).order_by('-created_at')

    return render(request, 'web_history.html', {**_ctx(request, 'history'), 'sessions': user_sessions})


def web_settings(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    username = _get_username(request)
    profile = None
    try:
        profile = UserProfile.objects.get(username=username)
    except UserProfile.DoesNotExist:
        pass

    return render(request, 'web_settings.html', {**_ctx(request, 'settings'), 'profile': profile})


# ===================== LANDING PAGE =====================

def landing(request):
    return render(request, 'landing.html')


# ===================== ADMIN DASHBOARD =====================

def dashboard(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    users = _add_avatar_colors(list(UserProfile.objects.all().order_by('-id')))
    sessions = TrainingSession.objects.all()

    total_cycles = sessions.aggregate(total=Sum('completed_cycles'))['total'] or 0
    avg_duration = sessions.aggregate(avg=Avg('session_duration_sec'))['avg'] or 0

    return render(request, 'dashboard.html', {
        'page': 'dashboard',
        'total_users': len(users),
        'total_sessions': sessions.count(),
        'total_cycles': total_cycles,
        'avg_duration': int(avg_duration),
        'recent_users': users[:5],
        'logged_in_user': _get_username(request),
    })


def patients(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    users = _add_avatar_colors(list(UserProfile.objects.all().order_by('-id')))
    return render(request, 'patients.html', {
        'page': 'patients', 'users': users,
        'logged_in_user': _get_username(request),
    })


def sessions(request):
    if not _is_logged_in(request):
        return redirect('web-login')

    all_sessions = TrainingSession.objects.all().order_by('-created_at')
    total_cycles = all_sessions.aggregate(total=Sum('completed_cycles'))['total'] or 0
    total_breaths = all_sessions.aggregate(total=Sum('breath_count'))['total'] or 0

    return render(request, 'sessions.html', {
        'page': 'sessions', 'sessions': all_sessions,
        'total_cycles': total_cycles, 'total_breaths': total_breaths,
        'logged_in_user': _get_username(request),
    })


def patient_detail(request, patient_id):
    if not _is_logged_in(request):
        return redirect('web-login')

    patient = get_object_or_404(UserProfile, id=patient_id)
    patient.avatar_color = AVATAR_COLORS[0]

    patient_sessions = TrainingSession.objects.filter(
        username=patient.username
    ).order_by('-created_at')

    return render(request, 'patient_detail.html', {
        'page': 'patients', 'patient': patient, 'sessions': patient_sessions,
        'logged_in_user': _get_username(request),
    })
