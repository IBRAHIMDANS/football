from __future__ import unicode_literals

from django.db import models


class Arbitre(models.Model):
    id_arbitre = models.AutoField(db_column='Id_Arbitre', primary_key=True)  # Field name made lowercase.
    a_nom = models.CharField(db_column='A_Nom', max_length=255)  # Field name made lowercase.
    a_prenom = models.CharField(db_column='A_Prenom', max_length=255)  # Field name made lowercase.
    a_mdp = models.CharField(db_column='A_Mdp', max_length=255)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'arbitre'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    id = models.ForeignKey('Entraineur', models.DO_NOTHING, db_column='id', primary_key=True)
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Entraineur(models.Model):
    id_entraineur = models.AutoField(db_column='Id_Entraineur', primary_key=True)  # Field name made lowercase.
    e_nom = models.CharField(db_column='E_Nom', max_length=255)  # Field name made lowercase.
    e_prenom = models.CharField(db_column='E_Prenom', max_length=255)  # Field name made lowercase.
    username = models.CharField(max_length=150)
    e_mdp = models.CharField(db_column='E_Mdp', max_length=128)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'entraineur'


class Equipe(models.Model):
    id_equipe = models.AutoField(db_column='Id_Equipe', primary_key=True)  # Field name made lowercase.
    e_nom = models.CharField(db_column='E_Nom', max_length=255)  # Field name made lowercase.
    id_entraineur = models.ForeignKey(Entraineur, models.DO_NOTHING, db_column='Id_Entraineur')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'equipe'


class Joueur(models.Model):
    id_joueur = models.AutoField(db_column='Id_Joueur', primary_key=True,verbose_name="Id Joueur")  # Field name made lowercase.
    j_nom = models.CharField(db_column='J_Nom', max_length=255,verbose_name="Nom")  # Field name made lowercase.
    j_prenom = models.CharField(db_column='J_Prenom', max_length=255,verbose_name="Prenom")  # Field name made lowercase.
    j_age = models.IntegerField(db_column='J_Age',verbose_name="Age")  # Field name made lowercase.
    j_taille = models.IntegerField(db_column='J_Taille',verbose_name="Taille")  # Field name made lowercase.
    j_poste = models.CharField(db_column='J_Poste', max_length=255,verbose_name="Poste")  # Field name made lowercase.
    j_status = models.CharField(db_column='J_Status', max_length=10,verbose_name="Status")  # Field name made lowercase.
    j_disponible = models.IntegerField(db_column='J_Disponible',verbose_name="Disponible")  # Field name made lowercase.
    j_position = models.IntegerField(db_column='J_Position',verbose_name="Position")  # Field name made lowercase.
    id_equipe = models.ForeignKey(Equipe, models.DO_NOTHING, db_column='Id_Equipe',verbose_name="Nom Equipe")  # Field name made lowercase.
    id_statistique = models.ForeignKey('Statistiques', models.DO_NOTHING, db_column='Id_Statistique', blank=True, null=True,verbose_name="Id Statistique") # Field name made lowercase.
    class Meta:
        managed = False
        db_table = 'joueur'


class Statistiques(models.Model):
    id_statistique = models.AutoField(db_column='Id_Statistique', primary_key=True)  # Field name made lowercase.
    s_but = models.IntegerField(db_column='S_But')  # Field name made lowercase.
    s_passe_decisive = models.IntegerField(db_column='S_Passe_Decisive')  # Field name made lowercase.
    s_carton_jaune = models.IntegerField(db_column='S_Carton_Jaune')  # Field name made lowercase.
    s_carton_rouge = models.IntegerField(db_column='S_Carton_Rouge')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'statistiques'
