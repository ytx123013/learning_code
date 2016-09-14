from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.template import loader,Context,RequestContext
from django.shortcuts import render_to_response
from models import Article
from models import Comment
from ViewModels import CommentForm

def index(req):
    return HttpResponse('<h1>hello world</h1>')

class Person(object):
    def __init__(self,id,name):
        self.id = id
        self.name = name

    def getPersonInfo(self):
        return 'name :'+self.name+'id :' + self.id

def getID(req, id, name):
    '''
    t = loader.get_template('GetIDView.html')
    c = Context({})

    return HttpResponse(t.render(c))
    '''
    person = Person(id,name)
    book_list = ['python','java','object-c']
    hehe_info = {
        'aaaa':'ytx',
        'bbbb':'ytx2'
    }
    display_info = {
        'title':'my page',
        'id':id,
        'name':name,
        'user_info':hehe_info,
        'person':person,
        'book_list':book_list
    }
    return render_to_response('GetIDView.html',display_info)

def get_articles_list_by_create_time(request):
    ctx = {
        'article_list' : Article.objects.order_by('publish_time')
    }
    return render_to_response('ArticleList.html',ctx)





def get_article_detail(request,id):
    article = Article.objects.get(id=id)

    if request.method == 'GET':
        form = CommentForm()
    else:
        form = CommentForm(request.POST)
        if form.is_valid():
            cleaned_data = form.cleaned_data
            cleaned_data['article'] = article
            Comment.objects.create(**cleaned_data)


    ctx = {
        'article' : article,
        'comments' : article.comments.all(),
        'form':form
    }
    # return render_to_response('ArticleDetail.html',ctx,context_instance=RequestContext(request))
    return render(request,'ArticleDetail.html',ctx)

def blog_index(request):
    return render_to_response('BlogIndex.html')