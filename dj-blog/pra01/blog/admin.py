from django.contrib import admin

# Register your models here.
from models import Article
from models import Category
from models import Comment
from models import Tag


admin.site.register(Article)
admin.site.register(Category)
admin.site.register(Comment)
admin.site.register(Tag)