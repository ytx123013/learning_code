"""pra01 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from blog import views as blogviews
import settings

print settings.BASE_DIR

urlpatterns = [
    url(r'^admin/', admin.site.urls, {'document_root':settings.BLOG_STATIC_ROOT}),

    url(r'^blog/index/$',blogviews.blog_index),
    url(r'^blog/index/(?P<id>\d{2})/(?P<name>[a-zA-Z]+)/$',blogviews.getID),
    url(r'^blog/bloglist/$',blogviews.get_articles_list_by_create_time,name='blog_list'),
    url(r'^blog/(?P<id>\d+)/$',blogviews.get_article_detail,name='blog_detail_by_id'),
]
