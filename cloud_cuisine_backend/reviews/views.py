from django.http import JsonResponse
from .models import Restaurant

def restaurant_list(request):
    data = [{"id": r.id, "name": r.name, "location": r.location, "category": r.category} for r in Restaurant.objects.all()]
    return JsonResponse(data, safe=False)

def restaurant_detail(request, restaurant_id):
    try:
        restaurant = Restaurant.objects.get(id=restaurant_id)
        reviews = restaurant.reviews.all()
        data = {
            "name": restaurant.name,
            "location": restaurant.location,
            "category": restaurant.category,
            "reviews": [
                {
                    "reviewer_name": r.reviewer_name,
                    "rating": r.rating,
                    "comment": r.comment,
                    "created_at": r.created_at.strftime("%Y-%m-%d %H:%M")
                } for r in reviews
            ]
        }
        return JsonResponse(data)
    except Restaurant.DoesNotExist:
        return JsonResponse({"error": "Not found"}, status=404)
