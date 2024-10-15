# Charger les bibliothèques
library(ggplot2)
library(readxl)

# Charger les données
insurance <- read_excel("insurance.xlsx")

# Afficher les premières lignes des données
View(insurance)

# Résumé statistique des données
summary_stats <- summary(insurance)
print(summary_stats)

# Afficher la structure des données
str(insurance)
#visualisation des donnnees : 
plot(insurance)

# Scatter plot entre "charges" et "age"
ggplot(insurance, aes(x = age, y = charges)) +
  geom_point() +
  labs(title = "Scatter Plot - Charges vs Age", x = "Age", y = "Charges")

# Scatter plot entre "charges" et "bmi"
ggplot(insurance, aes(x = bmi, y = charges)) +
  geom_point() +
  labs(title = "Scatter Plot - Charges vs BMI", x = "BMI", y = "Charges")


# Scatter plot entre "sex" et "charges" 
ggplot(insurance, aes(x = sex, y = charges, color = sex)) +
  geom_jitter(width = 0.2, height = 0) +  # Ajouter un léger bruit pour visualisation
  labs(title = "Scatter Plot - Charges vs Sex", x = "Sex", y = "Charges")

# Scatter plot entre "charges" et "children"
ggplot(insurance, aes(x = children, y = charges)) +
  geom_point() +
  labs(title = "Scatter Plot - Charges vs Children", x = "Children", y = "Charges")

# Scatter plot entre "charges" et "smoker"
ggplot(insurance, aes(x = smoker, y = charges, color = smoker)) +
  geom_jitter(width = 0.2, height = 0) +
  labs(title = "Scatter Plot - Charges vs Smoker", x = "Smoker", y = "Charges")

# Scatter plot entre "charges" et "region"
ggplot(insurance, aes(x = region, y = charges, color = region)) +
  geom_jitter(width = 0.2, height = 0) +
  labs(title = "Scatter Plot - Charges vs Region", x = "Region", y = "Charges")

ll1=lm(charges ~ age+sex+bmi+children+smoker+region, data=insurance)
summary(ll1)

ll2=lm(charges ~ age+bmi+children+smoker+region, data=insurance)
summary(ll2)

ll3=lm(charges ~ age+bmi+children+smoker, data=insurance)
summary(ll3)

coef(ll3)

confint(ll3)

fitted(ll3)

resid(ll3)

res<-resid(ll3)
plot(res,main="Résidus")
abline(h=0,col="red")
plot(fitted(ll3),res,main="Residuals vs. fitted")
abline(h=0,col="red")

## Prédiction
prev=predict(ll3, newdata=data.frame(age=80,bmi=28.90,children=3,smoker="yes"))
prev
round(prev, digits=2)

## Points levier
library(ggplot2)
alpha <- 0.05
n <- dim(insurance)[1]
p <- 2 # Dernier modèle : ll
analyses <- data.frame(obs=1:n)
analyses$levier <- hat(model.matrix(ll3))
seuil_levier <- 2*p/n


# Visualisation des leviers
ggplot(data=analyses,aes(x=obs,y=levier))+
  geom_bar(stat="identity",fill="steelblue")+
  geom_hline(yintercept=seuil_levier,col="red")+
  theme_minimal()+
  xlab("Observation")+
  ylab("Leviers")+
  scale_x_continuous(breaks=seq(0,n,by=5))

# Sélectionner les points leviers
idl <- analyses$levier>seuil_levier
idl
analyses$levier[idl]
which(idl == TRUE)

## La distance de Cook (leviers)
influence <- influence.measures(ll3)
names(influence)
colnames(influence$infmat)
analyses$dcook <- influence$infmat[,"cook.d"]  
seuil_dcook <- 4/(n-p)


# Visualisation des leviers
ggplot(data=analyses,aes(x=obs,y=dcook))+
  geom_bar(stat="identity",fill="steelblue")+
  geom_hline(yintercept=seuil_dcook,col="red")+
  theme_minimal()+
  xlab("Observation")+
  ylab("Distance de cook")+
  scale_x_continuous(breaks=seq(0,n,by=5))



# Sélectionner des points
idl <- analyses$dcook>seuil_dcook
idl
analyses$dcook[idl]
which(idl == TRUE)


# Calculer les VIF
vif_values <- car::vif(ll3)

# Afficher les VIF
print(vif_values)


# Afficher les VIF

install.packages("performance")
library(performance)

install.packages("caret")
library(caret)

check_collinearity(ll3)

cor(savings)



# Installer et charger le package "lmtest"
install.packages("lmtest")
library(lmtest)

# Tester l'homoscédasticité (égalité des variances)
# Test de Breusch-Pagan
bptest_result <- bptest(ll3)
print(bptest_result)

# Tester la normalité des résidus
shapiro_test_result <- shapiro.test(ll3$residuals)
print(shapiro_test_result)

# Installer et charger le package "ellipse"
install.packages("ellipse")
library(ellipse)

# Charger explicitement la bibliothèque "zoo"
library(zoo)

# Visualisation des coefficients avec intervalles de confiance
n_coef <- length(coef(ll3))
par(mfrow = c(n_coef, n_coef))

# Ajustez les marges ici
par(mar = c(2, 2, 2, 2))

for (i in 1:n_coef) {
  for (j in 1:n_coef) {
    if (i != j) {
      plot(ellipse(ll3, c(i, j), level = 0.95, type = "l", 
                   xlab = paste("beta", i - 1, sep = ""), 
                   ylab = paste("beta", j - 1, sep = "")))
      
      # Utiliser coef(ll3) plutôt que coef(resume)
      points(coef(ll3)[i], coef(ll3)[j], pch = 3)
      
      IC <- rbind(coef(ll3)[i] - coef(ll3)[i + 1] * qt(0.975, ll3$df.res),
                  coef(ll3)[i] + qt(0.975, ll3$df.res) * coef(ll3)[i + 1])
      
      lines(c(IC[1], IC[1], IC[2], IC[2], IC[1]), 
            c(IC[1 + 1], IC[2 + 1], IC[2 + 1], IC[1 + 1], IC[1 + 1]), 
            lty = 2)
      
      plot(c(IC[1], IC[1]), c(IC[1 + 1], IC[2 + 1]), lty = 2)
      lines(c(IC[1], IC[1]), lty = 2)
    }
  }
}
