
from django.shortcuts import render 
  
def home(request): 
    return render(request, "home.html") 
  
def review(request): 
    return render(request, "review.html") 

