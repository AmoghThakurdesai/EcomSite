from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.contrib.auth.models import User

class SignupForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'password1', 'password2']

class LoginForm(AuthenticationForm):
    class Meta:
        model = User
        fields = ['username', 'password']

from django import forms

class RawSQLForm(forms.Form):
    query = forms.CharField(
        widget=forms.Textarea(attrs={'rows': 5, 'cols': 50}),
        label='Enter your raw SQL query:'
    ) 