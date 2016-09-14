#coding=utf-8
from django import forms

class CommentForm(forms.Form):
    '''

    '''
    name = forms.CharField(label='称呼',max_length=16)
    content = forms.CharField(label='内容')