from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Category(models.Model):
    '''
    category
    '''
    name = models.CharField(max_length=32,unique=True)

    def __unicode__(self):
        return self.name

class Tag(models.Model):
    '''
    tag
    '''
    name = models.CharField(max_length=64)

class Article(models.Model):
    title = models.CharField(max_length=64,null=True)
    subtitle = models.CharField(max_length=64,null=True,blank=True)
    publish_time = models.DateField(auto_now_add=True)
    update_time = models.DateField(auto_now=True)
    content = models.TextField()
    '''
    many to one
    '''
    category = models.ForeignKey(Category)
    '''
    many to many
    '''
    tags = models.ManyToManyField(Tag)
    def __unicode__(self):
        return self.title


class Comment(models.Model):
    '''
    comment
    '''
    article = models.ForeignKey(Article,related_name='comments')

    name = models.CharField(max_length=64)
    content = models.CharField(max_length=256)
    create_time = models.DateTimeField(auto_now_add=True)

    def __unicode__(self):
        return self.content