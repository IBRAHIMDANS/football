# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.http import JsonResponse
from django.shortcuts import render
from django.shortcuts import redirect
from django.views.generic import TemplateView
from django.conf import settings
from django.contrib.auth import logout
from django.shortcuts import render
from django.core.urlresolvers import reverse

from GestionEquipe.models import Joueur
from GestionEquipe.models import Equipe
from GestionEquipe.models import Statistiques
from GestionEquipe.models import Arbitre
from GestionEquipe.models import Entraineur
from GestionEquipe.models import AuthUser


from pprint import pprint
from django.views.decorators.csrf import csrf_exempt
from .forms import classementForm
from .forms import modifierForm
from .forms import ajouterForm
from .forms import ConnexionForm
from django.contrib.auth import authenticate, login



#test
# Create your views here.

def home(request):
    if request.user.is_authenticated:
        # joueurs = Joueur.objects.all().filter()

        joueurs = Joueur.objects.all().filter(id_equipe=request.user.id)
        formJoueur = modifierForm(request.POST)
        formAjouter= ajouterForm(request.POST)
    else  :
        return HttpResponse("<p>Vous n'etes pas autoriser à acceder à cette page</p>")


    return render(request,'GestionEquipe/visu.html',locals())

def classement(request):

    joueurs = Joueur.objects.all().filter().order_by('nom')
    equipes = Equipe.objects.all()
    statistiques = Statistiques.objects.all()

    form = classementForm(request.POST)
    if form.is_valid():
        form.save()

    return render(request,'GestionEquipe/classement.html',locals())

def view_article(request, id_article):

    """

    Vue qui affiche un article selon son identifiant (ou ID, ici un numéro)

    Son ID est le second paramètre de la fonction (pour rappel, le premier

    paramètre est TOUJOURS la requête de l'utilisateur)

    """

    return render(request,'GestionEquipe/testos.html',locals())

@csrf_exempt
def supprimer(request):
	id=request.POST.get('id', None)
	Joueur.objects.filter(id_joueur=id).delete()
	if request.method== "POST":
		reponse="ok"
		return JsonResponse({'reponse' : 'reponse'})

@csrf_exempt
def infoJoueur(request):
    id=request.POST.get('id', None)
    joueurs = Joueur.objects.all().filter(id_joueur=id)
    for joueur in joueurs:
        nom=joueur.j_nom
        prenom=joueur.j_prenom
        age=joueur.j_age
        taille=joueur.j_taille
        poste=joueur.j_poste
        disponible=joueur.j_disponible
        position=joueur.j_position

    return JsonResponse({
            'id' : id,
            'nom' : nom,
            'prenom' : prenom,
            'age' : age,
            'taille' : taille,
            'poste' : poste,
            'disponible' : disponible,
            'position' :position,
            })


def Accueil(request):

    error = False

    if request.method == "POST":
        form = ConnexionForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            user = authenticate(username=username, password=password)  # Nous vérifions si les données sont correctes
            if user:  # Si l'objet renvoyé n'est pas None
                login(request, user)  # nous connectons l'utilisateur
            else: # sinon une erreur sera affichée
                error = True
    else:
        form = ConnexionForm()


    return render(request, 'Accueil.html', locals())

def modifierRemplir(request):
    id=request.POST.get('id', None)
    joueurs = Joueur.objects.all().filter(id_joueur=id)
    for joueur in joueurs:
        nom=joueur.j_nom
        prenom=joueur.j_prenom
        age=joueur.j_age
        taille=joueur.j_taille
        poste=joueur.j_poste
        disponible=joueur.j_disponible
        status=joueur.j_status
        position=joueur.j_position

    return JsonResponse({
            'id' : id,
            'nom' : nom,
            'prenom' : prenom,
            'age' : age,
            'taille' : taille,
            'poste' : poste,
            'disponible' : disponible,
            'status': status,
            'position': position,
            })

def modifier(request):
    #id=request.POST.get('donnees', None)
    id_joueur=int(request.POST.get('id_joueur', None))
    formEquipe= modifierForm(request.POST)
    if formEquipe.is_valid():
        testos= Joueur.objects.get(pk=id_joueur)
        test=modifierForm(request.POST, instance = testos)
        test.save()
        reponse="ok"
        return redirect('../../GestionEquipe')
    else:
        return JsonResponse({'reponse' : 'erreur'})

def ajouter(request):
    #id=request.POST.get('donnees', None)
    formAjouter= ajouterForm(request.POST)
    if formAjouter.is_valid():
        formAjouter.save()
        reponse="ok"
    else:
        reponse="nannn"
    return redirect('../../GestionEquipe/GestionEquipe')


def deconnexion(request):
    logout(request)
    return redirect(reverse(Accueil))

#
# class LoginView(TemplateView):
#
#   template_name = '/template/GestionEquipe/Accueil.html'
#
#   def post(self, request, **kwargs):
#
#     username = request.POST.get('username', False)
#     password = request.POST.get('password', False)
#     user = authenticate(username=username, password=password)
#     if user is not None and user.is_active:
#         login(request, user)
#         return HttpResponseRedirect( settings.LOGIN_REDIRECT_URL )
#
#     return render(request, self.template_name)
#
#
# class LogoutView(TemplateView):
#
#   template_name = '/template/GestionEquipe/Accueil.html'
#
#   def get(self, request, **kwargs):
#
#     logout(request)
#
#     return render(request, self.template_name)
