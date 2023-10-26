FROM python:3.9.5
ENV PYTHONUNBUFFERED=1 
###Una variable de entorno que esta dando vuelta en el servicio. Es para ver
###los resultados en consola, en el contenedor.
# Corremos este comando para actualizar pip.
RUN python -m pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
### La linea anterio instala todas las librerias en el contenedor antes de 
### cargarlo, así cada que salgamos y volvamos no hay que instalarlas todas
### manualmente
# En este caso como ya está creado el proyecto asignamos
# como directorio de trabajo el directorio raíz del mismo.
WORKDIR /opt/back_end/marvel  
### 
COPY . /opt/back_end
RUN apt-get update && apt-get -y install vim
CMD python manage.py runserver 0.0.0.0:8000