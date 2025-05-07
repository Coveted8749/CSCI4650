
from django.shortcuts import render, get_object_or_404
from reviews.models import ReviewsAddress, ReviewsStore, ReviewsReview
  
def home(request): 
    storeData = ReviewsStore.objects.all()
    addressData = ReviewsAddress.objects.all()  # or any query you want
    return render(request, 'home.html', {'addressData': addressData, 'storeData': storeData})
  
def store_detail(request, pk):
    store = get_object_or_404(ReviewsStore, pk=pk)
    reviews = ReviewsReview.objects.filter(store=store)
    return render(request, 'store_detail.html', {'store': store, 'reviews': reviews})



