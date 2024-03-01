from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic.edit import CreateView, UpdateView
from django.urls import reverse_lazy, reverse
from .forms import CustomUserCreationForm, CustomUserUpdateForm
from django.views.generic import ListView, DetailView
from .models import CustomUser


class SignUpView(CreateView):
  template_name = 'uzytkownicy/register.html'
  success_url = reverse_lazy('login')
  form_class = CustomUserCreationForm
  success_message = "Your profile was created successfully"

# Create your views here.
def logout_view(request):
	logout(request)
	# messages.info(request, "Logged out successfully!")
	return redirect('login')





class Register(View):
	def get(self, request):
		return render(request, 'uzytkownicy/register.html')



class CustomerListView(ListView):
	context_object_name = "users"
	combined_queryset = CustomUser.objects.exclude(admin='True').exclude(detektyw='True')
	queryset = combined_queryset.order_by("nazwisko")
	template_name = 'uzytkownicy/user_list.html'

	def get_context_data(self, *args, **kwargs):
		context = super(CustomerListView, self).get_context_data(*args,**kwargs)
		context['type'] = 'klientów'
		return context


class StaffListView(ListView):
	context_object_name = "users"
	combined_queryset = CustomUser.objects.filter(admin='True')|CustomUser.objects.filter(detektyw='True')
	queryset = combined_queryset.order_by("nazwisko")
	template_name = 'uzytkownicy/user_list.html'

	def get_context_data(self, *args, **kwargs):
		context = super(StaffListView, self).get_context_data(*args,**kwargs)
		context['type'] = 'detektywów'
		return context


class CustomerDetailView(DetailView):
	model = CustomUser
	context_object_name = "user"
	# queryset = CustomUser.objects.filter(is_staff='False').order_by("nazwisko")
	template_name = 'uzytkownicy/user_detail.html'


class CustomerUpdateView(UpdateView):
	model = CustomUser
	context_object_name = "user"
	form_class = CustomUserUpdateForm
	# queryset = CustomUser.objects.filter(is_staff='False').order_by("nazwisko")
	template_name = 'uzytkownicy/user_update.html'
	# fields = ["imie", "nazwisko", "adres", "email", "numer_telefonu", "inne", "detektyw", "admin"]

	def get_success_url(self):
		return reverse('customer_list')