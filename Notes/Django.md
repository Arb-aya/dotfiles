# Django

Needs to be installed with pip: `pip install django`

You can then create a project with: 
`django-admin startproject <project_name> <project_directory>`

Then to run the project in the project directory:
`python manage runserver`

You will need to create a superuser for the sqlite db django creates
for you: `maange.py createsuperuser`


## Migrations
Make migrations based on newly created models: 
`manage.py makemigrations`
You can use the `--dry-run` flag to see what will happen

To see migrations:
`manage.py showmigrations`

To apply migrations:
`manage.py migrate`
You can use the `-plan` flag to see what will happen

## Fixtures
A quick and easy way to load data into your database. Create a folder named
`fixtures` in your app and in there two data files (for example JSON).

The fixture data must match models that are available in the app.

To use a fixture file: `manage.py loaddata <fixture file name>`

## Django Apps
Django components are referred to as "apps". Apps can be installed
into your project. For example, an app that handles login and
user authentication.

### Create App

`python manage startapp <app_name>`

This will then create the directory `app_name` in which you can manage
the views, models and controller logic.

To use an app in your django project you will need to register it in
`settings.py`, in  `INSTALLED_APPS`.

#### Views

Views in django are functions that accept HTTP requests. If you want
to return a http response you will need to import httpresponse from
django shortcuts: `from django.shortcuts import HttpResponse` and use
it like so:

```
def foobar(request):
	return HttpResponse('hello')
```

#### Register view with urls

Once the view function has been written it needs to be registered in
the urls.py file in the project directory.

Import the view function from the app: `from foo.views import foobar`

Then using the path function register the url:

`path('path user visits','view handler',name='')`
`path('foobar/', foobar ,name='foobar')`

#### Templates

Create a `templates/<app_name>` directory in your app directory.

It is important to create a "namespace" for templates as django
returns the first template found of a name. This way you can have two
templates with the same name, but return the one you desire.

Once a template has been created you will want to return it in the
views.py like so:

` return render(request, 'foo/foo_bar.html') `

Templating is similar to Jinja2. There is an `{% empty %}` tag that can
be used for when no data is returned to the template

#### Models

Created in the `app_name/models.py`.

```
	class Foobar(models.Model):
		foo = models.CharField(max_length=20,blank=False,null=False)
		...
```

You will then need to migrate your model.See above section.

If you want to be able to interact with your model in the admin panel
you will need to register it in the `admin.py` file of your
app_directory:
` from .models import Foobar `
` admin.site.register(Foobar) `

#### Forms

Django can create forms, and manage their validation, based on the
models you create.

You will need to provide the CSRF Token for forms via: 
`{% csrf_token %}`

Create a forms.py in your app_directory. And import:
` from django import forms `

You will also need to import all relevant models

You will need to inhert from a type of form for example
`forms.ModelForm`

You will also need to create an inner `Meta` class.

Which at a basic level tells the form class which model it is linked
to, and which fields of that model should be displayed on the form:

```
class Meta:
	model = foobar
	fields = ['foo','bar']
```

