from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User
from .models import ReviewsReview, ReviewsStore, Customer

def home(request): 
	storeData = ReviewsStore.objects.all()
	#addressData = ReviewsAddress.objects.all()  # or any query you want
	return render(request, 'home.html', {'storeData': storeData})
  
def store_detail(request, pk):
	store = get_object_or_404(ReviewsStore, pk=pk)
	reviews = ReviewsReview.objects.filter(store=store)
	return render(request, 'store_detail.html', {'store': store, 'reviews': reviews})


def reviews_for_store(request, store_id):
	 store = get_object_or_404(ReviewsStore, store_id=store_id)
	 reviews = ReviewsReview.objects.filter(store=store)
	
	 review_data = [
	     {
	         "reviewer_name": review.user.first_name + " " + review.user.last_name,
	         "rating": review.number_of_stars,
	         "comment": review.review_text,
	         "created_at": review.review_timestamp.strftime("%Y-%m-%d %H:%M")
	     } for review in reviews
	 ]
	
	 return JsonResponse(review_data, safe=False)

def reviews_by_user(request, user_id):
	 user = get_object_or_404(User, id=user_id)
	 reviews = ReviewsReview.objects.filter(user=user)
	
	 review_data = [
	     {
	         "store_name": review.store.store_name,
	         "rating": review.number_of_stars,
	         "comment": review.review_text,
	         "created_at": review.review_timestamp.strftime("%Y-%m-%d %H:%M")
	     } for review in reviews
	 ]
	
	 return JsonResponse(review_data, safe=False)

def add_review(request, store_id):
	store = get_object_or_404(ReviewsStore, store_id=store_id)
	
	if request.method == 'POST':
	     # Get the data from the POST request
	    rating = request.POST.get('rating')
	    comment = request.POST.get('comment')
	    
	     # Ensure rating is an integer and within valid range
	    if rating and comment:
	        try:
	            rating = int(rating)
	            if rating < 1 or rating > 5:
	                return JsonResponse({"error": "Rating must be between 1 and 5"}, status=400)
	        except ValueError:
	            return JsonResponse({"error": "Invalid rating value"}, status=400)
	        
	         # Create and save the review
	        review = ReviewsReview(
	            store=store,
	            customer=Customer(customer_id=1),  # Set the currently logged-in user
	            number_of_stars=rating,
	            review_text=comment
	        )
	        review.save()
	        
	        #return JsonResponse({"message": "Review added successfully!"}, status=201)
	        reviews = ReviewsReview.objects.filter(store=store)
	        return render(request, 'store_detail.html', {'store': store, 'reviews': reviews})
	    else:
	        return JsonResponse({"error": "Rating and comment are required"}, status=400)
	
	return render(request, 'add_review.html', {'store': store})
