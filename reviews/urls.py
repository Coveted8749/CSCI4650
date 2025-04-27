from django.urls import path
from . import views

urlpatterns = [
    path('store/<int:store_id>/reviews/', views.reviews_for_store, name='reviews_for_store'),
    path('user/<int:user_id>/reviews/', views.reviews_by_user, name='reviews_by_user'),
    path('store/<int:store_id>/add_review/', views.add_review, name='add_review'),
]
