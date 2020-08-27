from application import db

class Fortunes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    color=db.Column(db.String(300))
    starsign=db.Column(db.String(300))
    fortune=db.Column(db.String(300))
    
    def __repr__(self):
        return ' '.join('Color:',self.color,'Starsign:',self.starsign,'Fortune:',self.fortune)