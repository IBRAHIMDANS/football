from django import forms
from .models import Joueur
from .models import Equipe

class classementForm(forms.ModelForm):
    class Meta:
        model = Joueur
        #fields = '__all__'
        exclude = ['id_joueur']

class modifierForm(forms.ModelForm):

	class Meta:

		model = Joueur
		fields = '__all__'
		exclude = ['id_statistique','id_equipe']

class ajouterForm(forms.ModelForm):

	class Meta:

		model = Joueur
		fields = '__all__'
		exclude = ['id_joueur','id_statistique','id_equipe']
		#exclude = ['status', 'id_equipe','position']

class ConnexionForm(forms.Form):

    username = forms.CharField(label="Nom d'utilisateur", max_length=30)
    password = forms.CharField(label="Mot de passe", widget=forms.PasswordInput)
