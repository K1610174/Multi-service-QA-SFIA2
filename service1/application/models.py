from application import db

class Fortunes(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    color=db.Column(db.String(50))
    starsign=db.Column(db.String(50))
    fortune=db.Column(db.String(150))
    
    def __repr__(self):
        return ' '.join('Color:',self.color,'Starsign:',self.starsign,'Fortune:',self.fortune)