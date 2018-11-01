from django.conf.urls import url
from django.contrib.auth.decorators import login_required
from . import views


urlpatterns = [
   # url(r'^visualisation$', views.home),
    url(r'^article/(?P<id_article>\d+)$', views.view_article),
    url(r'^GestionEquipe$', views.home, name='GestionEquipe'),
    url(r'^$', views.Accueil, name='Accueil'),
    url(r'^ajax/supprimer/$', views.supprimer, name='supprimer'),
    url(r'^ajax/infoJoueur/$', views.infoJoueur, name='infoJoueur'),
    url(r'^ajax/modifierRemplir/$', views.modifierRemplir, name='modifierRemplir'),
    url(r'^ajax/modifier/$', views.modifier, name='modifier'),
    url(r'^ajouter/$', views.ajouter, name='ajouter'),
    url(r'^classement$', views.classement, name='classement'),
    url(r'^classement$', views.classement, name='classement'),
    url(r'^deconnexion$', views.deconnexion, name='deconnexion'),

    ]
