from django.db import models
from django.contrib.auth.models import User  # Import the built-in User model

class Address(models.Model):
    street_address = models.CharField(max_length=255, primary_key=True)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=2)
    zip = models.CharField(max_length=10)
    latitude = models.DecimalField(max_digits=9, decimal_places=6)
    longitude = models.DecimalField(max_digits=9, decimal_places=6)

    def __str__(self):
        return f'{self.street_address}, {self.city}, {self.state}, {self.zip}'

class Store(models.Model):
    store_id = models.AutoField(primary_key=True)
    store_name = models.CharField(max_length=255)
    street_address = models.ForeignKey(Address, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.store_name

class Review(models.Model):
    STAR_CHOICES = [
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
    ]
    
    store = models.ForeignKey(Store, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Use the built-in User model
    review_timestamp = models.DateTimeField(auto_now_add=True)
    number_of_stars = models.IntegerField(choices=STAR_CHOICES, default=3)  # Default to 3 stars if not specified
    review_text = models.TextField()

    class Meta:
        unique_together = ('user', 'review_timestamp')

    def __str__(self):
        return f'Review by {self.user} at {self.store}'

class MenuItem(models.Model):
    item_id = models.AutoField(primary_key=True)
    description = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)
    store = models.ForeignKey(Store, on_delete=models.CASCADE)

    def __str__(self):
        return self.description
