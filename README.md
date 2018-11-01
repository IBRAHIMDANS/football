# football

#Pour faire fonctionner mysql avec python :
 sudo apt-get install python-mysqldb

#Installation pip si besoin (normalement installer de base si version sup à Python 2.7 inclus)
 sudo apt-get install python-pip

#Installer Django choix version 
 sudo pip install Django==1.10
 sudo pip install Django --upgrade


#Pour installer la base de donnée : 
 il faut installer mysql s'il n'est pas installer :
	sudo apt-get install mysql-server
 mysql -u root -p
 source chemin/vers/football/documents_annexes/football.sql
# faut remplacer chemin/vers par le chemin complet jusqu'au fichier :)
# Si vous n'y arrivez pas, utilisez PHPmyAdmin

#Pour envoyer ses modifications sur github :
	#si on veut envoyer les modifs d'un fichier : git add cheminDuFichier
	#si on veut envoyer toutes ses modifs : git add --all
  #Puis : git commit -m "message qui indique ce qu'on fait"
	: git push origin master
	
#Pour récuperer les mises à jour du dépôt github :
	sudo git pull

#Lancer serveur de test en étant dans la racine du projet (avec manage.py)
 sudo python manage.py runserver

 #pour django admin le superuser est "football" et son mdp est "fpassword" 


