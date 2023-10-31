import requests
from bs4 import BeautifulSoup

def get_mercado_libre_link(brand):
    def get_mercado_libre_link(brand):
        """Devuelve un enlace de Mercado Libre con la marca especificada.

        Args:
            brand: La marca que se desea buscar.

        Returns:
            El enlace de Mercado Libre para la marca especificada.
        """

        url = f"https://listado.mercadolibre.com.ar/%7Bbrand%7D#D[A:{brand}]"
        response = requests.get(url)

        if response.status_code == 200:
            soup = BeautifulSoup(response.text, "html.parser")
            results = soup.find_all("div", class_="item__info")

            if results:
                link = results[0].find("a", class_="item__link").get("href")
                return link
            else:
                return None
        else:
            raise ValueError()

def main():
    brand = input("Introduce la marca que deseas buscar: ")
    link = f"https://listado.mercadolibre.com.ar/{brand}"

    if link is not None:
        print(f"El enlace de Mercado Libre para {brand} es: {link}")
    else:
        print(f"No se encontró ningún resultado para {brand} en Mercado Libre.")

if __name__ == "__main__":
    main()