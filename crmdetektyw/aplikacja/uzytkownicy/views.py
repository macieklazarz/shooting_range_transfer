from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic.edit import CreateView, UpdateView
from django.urls import reverse_lazy, reverse
from .forms import CustomUserCreationForm, CustomUserUpdateForm, StaffUpdateForm, PojazdFormset
from django.views.generic import ListView, DetailView
from .models import CustomUser, Pojazd


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
	template_name = 'uzytkownicy/user_update.html'


	def get_form_kwargs(self, *args, **kwargs):
		kwargs = super(CustomerUpdateView, self).get_form_kwargs()
		uuid = self.kwargs['pk']
		user = CustomUser.objects.get(id=uuid)
		is_detektyw = user.detektyw

		kwargs['is_detektyw'] = is_detektyw

		return kwargs


	def get_success_url(self):
		return reverse('customer_list')





class CustomUserInline():
	form_class = StaffUpdateForm
	model = CustomUser
	template_name = "uzytkownicy/staff_update.html"


	def form_valid(self, form):
		named_formsets = self.get_named_formsets()
		if not all((x.is_valid() for x in named_formsets.values())):
			return self.render_to_response(self.get_context_data(form=form))

		self.object = form.save()

		for name, formset in named_formsets.items():
			formset_save_func = getattr(self, 'formset_{0}_valid'.format(name), None)
			if formset_save_func is not None:
				formset_save_func(formset)
			else:
				formset.save()
		return redirect('staff_list')

	def formset_auta_valid(self, formset):
		auta = formset.save(commit=False)  # self.save_formset(formset, contact)

		for obj in formset.deleted_objects:
			obj.delete()
		for auto in auta:
			auto.customuser = self.object
			auto.save()


class StaffUpdateView(CustomUserInline, UpdateView):
	def get_context_data(self, **kwargs):
		ctx = super(StaffUpdateView, self).get_context_data(**kwargs)
		ctx['named_formsets'] = self.get_named_formsets()
		return ctx

	def get_named_formsets(self):
		return {'auta': PojazdFormset(self.request.POST or None, self.request.FILES or None, instance=self.object, prefix='variants'),
		}



# class StaffUpdateView(UpdateView):
# 	model = CustomUser
# 	# context_object_name = "user"
# 	# fields = ["nazwisko"]
# 	form_class = StaffUpdateForm
# 	template_name = 'uzytkownicy/staff_update.html'

# 	def get_context_data(self, **kwargs):
# 		data = super().get_context_data(**kwargs)
# 		if self.request.POST:
# 			data["pojazd"] = PojazdFormset(self.request.POST, instance=self.object)
# 		else:
# 			data["pojazd"] = PojazdFormset(instance=self.object)
# 		return data

# 	def form_valid(self, form):
# 		context = self.get_context_data()
# 		pojazd = context["pojazd"]
# 		self.object = form.save()
# 		if pojazd.is_valid():
# 			pojazd.instance = self.object
# 			pojazd.save()
# 		return super().form_valid(form)


# 	def get_success_url(self):
# 		return reverse('staff_list')


class PojazdCreateView(CreateView):
	model = Pojazd
	fields = ["numer_rejestracyjny"]