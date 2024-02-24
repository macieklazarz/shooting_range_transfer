from django.shortcuts import render
from django.http import HttpResponse
from .models import Article

POSTS = [
	{
		'author': 'Devs-Mentoring.pl',
		'title': 'To be or not to be',
		'content': 'That is my first post',
		'date': '28 April 2021'
	},
	{
		'author': 'Devs-Mentoring.pl',
		'title': 'What if..',
		'content': 'That is my second post',
		'date': '29 April 2021'
	}

]



def home(request):
	return render(request, 'blog/home.html',  {'title': 'Home', 'posts': Article.objects.all()})
	# return render(request, 'blog/home.html',  {'title': 'Home', 'posts': POSTS})


def about(request):
	return render(request, 'blog/about.html',  {'title': 'About'})

# Create your views here.
