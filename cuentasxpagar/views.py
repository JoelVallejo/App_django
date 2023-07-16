from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth import login
from django.db import IntegrityError

# Create your views here.


def Home(request):
    return render(request, 'home.html')


def Registro(request):

    if request.method == 'GET':
        return render(request, 'registro.html', {
            'form': UserCreationForm
        })

    else:
        if request.POST['password1'] == request.POST['password2']:
            try:
                # registro
                user = User.objects.create_user(username=request.POST['username'],
                                                password=request.POST['password2'])
                user.save()
                return redirect('login')
            except IntegrityError:
                return render(request, 'registro.html', {
                    'form': UserCreationForm,
                    "error": 'Usuario ya creado!!'
                })

        return render(request, 'registro.html', {
            'form': UserCreationForm,
            "error": 'Password no coinciden'
        })


def Login(request):
    if request.method == 'GET':
        return render(request, 'login.html', {
            'form': UserCreationForm
        })

    else:
        if request.POST['password1'] == request.POST['password2']:
            try:
                # registro
                user = User.objects.create_user(username=request.POST['username'],
                                                password=request.POST['password2'])
                user.save()
                login(request, user)
                return redirect('cuentasxpagar')
            except IntegrityError:
                return render(request, 'login.html', {
                    'form': UserCreationForm,
                    "error": 'Usuario ya creado!!'
                })

        return render(request, 'login.html', {
            'form': UserCreationForm,
            "error": 'Password no coinciden'
        })

def CuentaP(request):
    return render(request, 'cuentasxpagar.html')