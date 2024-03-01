from django.contrib.auth.forms import UserCreationForm, UserChangeForm, AuthenticationForm, UsernameField

from django import forms

from .models import CustomUser


class CustomUserCreationForm(UserCreationForm):
    email = forms.EmailField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user', 'placeholder': 'Adres email', 'id': 'exampleInputEmail'}))
    imie = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Imię','id': 'exampleFirstName',}))
    nazwisko = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Nazwisko','id': 'exampleLastName',}))
    adres = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Adres','id': 'exampleInputEmail',}))
    numer_telefonu = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Numer telefonu','id': 'exampleInputEmail',}))
    password1 = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Hasło','id': 'exampleInputPassword1',}))
    password2 = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Powtórz hasło','id': 'exampleInputPassword2',}))


    class Meta:
        model = CustomUser
        fields = ("email", "imie", "nazwisko", "adres", "numer_telefonu","password1", "password2")
        # widgets = {
        #     'email': EmailField(attrs={'class': 'form-control form-control-user', 'placeholder': 'Adres email', 'id': 'exampleInputEmail'}),
        # }



class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = CustomUser
        fields = ("email",)


class UserLoginForm(AuthenticationForm):


    # def __init__(self, *args, **kwargs):
    #     super(UserLoginForm, self).__init__(*args, **kwargs)

    username = forms.EmailField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user', 'placeholder': 'Adres email', 'id': 'exampleInputEmail'}))
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={
            'class': 'form-control form-control-user',
            'placeholder': 'Hasło',
            'id': 'exampleInputPassword',
        }
))




class CustomUserUpdateForm(forms.ModelForm):
    email = forms.EmailField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user', 'placeholder': 'Adres email', 'id': 'exampleInputEmail'}))
    imie = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Imię','id': 'exampleFirstName',}))
    nazwisko = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Nazwisko','id': 'exampleLastName',}))
    adres = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Adres','id': 'exampleInputEmail',}))
    numer_telefonu = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'form-control form-control-user','placeholder': 'Numer telefonu','id': 'exampleInputEmail',}))
    inne = forms.CharField(widget=forms.Textarea(
        attrs={'class': 'form-control form-control-user','placeholder': 'Inne','id': 'exampleInputEmail',}))


    class Meta:
        model = CustomUser
        fields = ("email", "imie", "nazwisko", "adres", "numer_telefonu", "inne", "admin", "detektyw")