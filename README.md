Commit notes 4/26: 

This likely will not run after downloaded, as I changed the database engine and that requires migration. In the settings.py, change that to match your login info for mysql. We probably should change to using the .cnf method (which I have an example for, but does nothing right now) but this is fine for now. 

Run python manage.py migrate after fixing mysql info.   