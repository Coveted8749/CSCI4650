from django.contrib import admin
from .models import Address, Store, Review, MenuItem

admin.site.register(Address)
admin.site.register(Store)
admin.site.register(Review)
admin.site.register(MenuItem)

