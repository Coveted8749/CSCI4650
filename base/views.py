
from django.shortcuts import render 
from reviews.models import ReviewsAddress 
  
def home(request): 
    data = ReviewsAddress.objects.get(address_id=1)  # or any query you want
    return render(request, 'home.html', {'data': data})
  
def review(request): 
    return render(request, "review.html") 

