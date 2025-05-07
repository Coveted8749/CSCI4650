
from django.shortcuts import render 
from reviews.models import ReviewsAddress, ReviewsStore 
  
def home(request): 
    storeData = ReviewsStore.objects.all()
    addressData = ReviewsAddress.objects.get(address_id=1)  # or any query you want
    return render(request, 'home.html', {'addressData': addressData, 'storeData': storeData})
  
def review(request): 
    return render(request, "review.html") 

