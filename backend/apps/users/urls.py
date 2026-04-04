from django.urls import path
from . import views

urlpatterns = [
    path("register/", views.RegisterView.as_view(), name="user_register"),
    path("me/", views.MeView.as_view(), name="user_me"),
    path("me/password/", views.change_password, name="user_change_password"),
    path("password-reset/", views.request_password_reset, name="user_password_reset_request"),
    path("password-reset/confirm/", views.confirm_password_reset, name="user_password_reset_confirm"),
    path("invites/", views.create_invite, name="user_create_invite"),
    path("invites/<uuid:token>/", views.validate_invite, name="user_validate_invite"),
]
