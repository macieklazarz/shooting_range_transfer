from django.urls import path

from users.views import UsersListView
from users.models import CustomUser


urlpatterns = [
    path("", UsersListView.as_view(model=CustomUser), name="user_list_view"),
]