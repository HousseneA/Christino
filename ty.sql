DROP TABLE IF EXISTS `Visiteur`;
CREATE TABLE IF NOT EXISTS `Visiteur` (
  `idVisiteur` varchar(65) NOT NULL,
  `nomVisiteur` varchar(65) NOT NULL,
  
  `image` LONGBLOB NOT NULL,

  
  PRIMARY KEY (`idVisiteur`)
);




DROP TABLE IF EXISTS `Site`;
CREATE TABLE IF NOT EXISTS `Site` (
  `idSite` int(11) NOT NULL AUTO_INCREMENT,
  `nomSite` varchar(65) NOT NULL,
  `lieuSite` varchar(50) NOT NULL,
  `tarifJSite` int(11) NOT NULL,
  `image` LONGBLOB NOT NULL,
  PRIMARY KEY (`idSite`)
);


DROP TABLE IF EXISTS `Visiter`;
CREATE TABLE IF NOT EXISTS `Visiter` (
  `idVisiteur` varchar(65) NOT NULL,
  `idSite` int(11) NOT NULL,
  `nbjoursVisiter` int(11) NOT NULL,
  `date` date NOT NULL,

  FOREIGN KEY (`idVisiteur`) REFERENCES Visiteur(`idVisiteur`) ,
  FOREIGN KEY (`idSite`) REFERENCES Site(`idSite`) 
  
);





DROP TABLE IF EXISTS `Visiter`;
CREATE TABLE IF NOT EXISTS `Visiter` (
    `idSite` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,

  PRIMARY KEY (`idSite`)


  
);








DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `idSite` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`idSite`)
);




















DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(65) NOT NULL,
  `lieu` varchar(50) NOT NULL,
  `salaire` int(11) NOT NULL,

  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(250)  NULL,

  PRIMARY KEY (`id`)
);
















tab=["zero","un","deux","trois","quatre","cinq","six","sept","huit","neuf","dix","onze","douze","treize","quatorze","quinze","seize","dix-sept","dix-huit","dix-neuf"]
tab1=["vingt","trente","quarent","cinqante","soixante","soixant-dix","quatre-vinght","quatre-vinght-dix"]
tab2=["mille","million","milliard"]
t=[]
s=[]
g=""
def division():
    r=4564510
    i=0
    while(i<3):
        p=int(r)%1000
        r=r/1000
        t.append(p)
        #print(t)
        i+=1
    j=len(t)-1
    while(j>=0):
        e=0
        while(e<len(t)):
            f=int(t[j])%100
            t[j]=t[j]/100
            if(f==0):
                print("")
            else:
                s.append(f)
                print(s)
            e+=1
        j-=1
division()

def chagemet():
    r=0
    while(r<len(s)):
        
        r+=1
        





