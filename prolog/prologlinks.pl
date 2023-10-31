% Relación de marcas y enlaces a subcategorías
link_subcategoria(electricas, 'https://listado.mercadolibre.com.ar/herramientas/herramientas-electricas/').
link_subcategoria(manuales, 'https://listado.mercadolibre.com.ar/herramientas/herramientas-manuales/').
link_subcategoria(jardin, 'https://listado.mercadolibre.com.ar/herramientas/herramientas-jardin/').

% Relación de marcas y enlaces a página principal de marcas
link_marca(bremen, 'https://listado.mercadolibre.com.ar/bremen').
link_marca(crossmaster, 'https://listado.mercadolibre.com.ar/crossmaster#D[A:crossmaster]').
link_marca(truper, 'https://listado.mercadolibre.com.ar/truper#D[A:truper]').
link_marca(bahco, 'https://listado.mercadolibre.com.ar/bahco#D[A:bahco]').
link_marca(hamilton, 'https://listado.mercadolibre.com.ar/hamilton#D[A:hamilton]').
link_marca(harden, 'https://listado.mercadolibre.com.ar/harden-herramientas#D[A:harden%20herramientas]').
link_marca(total, 'https://listado.mercadolibre.com.ar/total-herramientas#D[A:total%20herramientas]').
link_marca(bulit, 'https://listado.mercadolibre.com.ar/bulit-herramientas#D[A:bulit%20herramientas]').

% Regla para obtener enlaces de subcategorías de una marca dada
enlaces_subcategoria(Marca, Enlaces) :-
    findall(Enlace, link_subcategoria(Marca, Enlace), Enlaces).

% Regla para obtener enlaces a la página principal de marcas
enlace_pagina_marca(Marca, Links) :-
    findall(Link, link_marca(Marca, Link), Links).

