from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from swiplserver import PrologMQI
from rasa_sdk.events import SlotSet


class DecirCategoria(Action):
    def name(self) -> Text:
        return "decir_categoria"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        tipocategoria = tracker.get_slot("categoria")
        marca = tracker.get_slot("marca")
        producto = tracker.get_slot("producto")
        print("decir cat")
        print(producto)
        print(tipocategoria)
        print(marca)

        if marca != None:
            dispatcher.utter_message(f"este es el listado de las herramientas de la marca {marca} que tenemos")
            with PrologMQI(port=8000) as mqi:
                with mqi.create_thread() as prolog_thread:
                    prolog_thread.query("consult('D:/Usuario/Desktop/rasa/prolog/prolograsa.pl').")
                    response = prolog_thread.query(f"herramientas_en_marca(Marca, Herramientas).")  # crear regla
                    lista = response[0]
                    dispatcher.utter_message(text=f"{lista}")
        elif tipocategoria != None:
            dispatcher.utter_message(f"este es el listado de las herramientas de la categoria {tipocategoria} que tenemos")
            with PrologMQI(port=8000) as mqi:
                with mqi.create_thread() as prolog_thread:
                    prolog_thread.query("consult('D:/Usuario/Desktop/rasa/prolog/prolograsa.pl').")
                    response = prolog_thread.query(f"herramientas_en_categoria({tipocategoria},Herramientas).")  # crear regla
                    lista = response[0]
                    dispatcher.utter_message(text=f"{lista}")
        elif producto != None:
            print("1")
            with PrologMQI(port=8000) as mqi:
                with mqi.create_thread() as prolog_thread:
                    prolog_thread.query("consult('D:/Usuario/Desktop/rasa/prolog/prolograsa.pl').")
                    response = prolog_thread.query(f"categoria_de_herramienta({producto},Categoria).")  # crear regla
                    categoria = response[0]
            dispatcher.utter_message(text=f"el producto que enviaste pertenece a la categoria {categoria}, en este caso puedo enviarte el link de la categoria")
            return[SlotSet("categoria", categoria)]

        return []


class EnviarLink(Action):  # devuelve el nombre de la categoria
    def name(self) -> Text:
        return "enviar_link"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        dispatcher.utter_message("adjunto un link para que puedas ver los productos en mercado libre!")
        tipocategoria = tracker.get_slot("categoria")
        print(tipocategoria)
        marca = tracker.get_slot("marca")
        if marca != None:
            print(1)
            with PrologMQI(port=8000) as mqi:
                with mqi.create_thread() as prolog_thread:
                    prolog_thread.query("consult('D:/Usuario/Desktop/rasa/prolog/prologlinks.pl').")
                    response = prolog_thread.query(f"enlace_pagina_marca({marca},Links).")  # crear regla
                    print("Response:", response)  # Agregar esta línea para verificar la respuesta
                    dispatcher.utter_message(text=f"{response}")
        elif tipocategoria != None:
            with PrologMQI(port=8000) as mqi:
                with mqi.create_thread() as prolog_thread:
                    prolog_thread.query("consult('D:/Usuario/Desktop/rasa/prolog/prologlinks.pl').")
                    response = prolog_thread.query(f"enlaces_subcategoria({tipocategoria},Enlaces).")  # crear regla
                    enlaces = response[0]
                    dispatcher.utter_message(text=f"{enlaces}")
        return [SlotSet("categoria", None), SlotSet("marca", None), SlotSet("producto", None)]
