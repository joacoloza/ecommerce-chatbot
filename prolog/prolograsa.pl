% hechos que dan el noombre del producto
producto(martillo).
producto(destornillador).
producto(sierra).
producto(taladro).
producto(llave_inglesa).
producto(amoladora).
producto(cinta_metrica).
producto(soldador).
producto(cepillo_jardin).
producto(pala).
producto(rastrillo).
producto(motosierras).
producto(bordeadoras).
producto(desmalezadora).
producto(sopladora).
producto(cortadora_de_cesped).
producto(taladro_perforador).
producto(sierra_circular).
producto(lija_electrica).
producto(pistola_pintar).
producto(pinza).
producto(ganzua).
producto(morsa).
producto(serrucho).
producto(sierra_cinta).
producto(linterna).
producto(destornillador_angular).
producto(pinzas_corte).
producto(lijadora_orbital).

% marcas de los productos
marca(bremen).
marca(crossmaster).
marca(truper).
marca(bahco).
marca(hamilton).
marca(harden).
marca(total).
marca(ruhlmann).
marca(bulit).

%sub_categoria de los productos
subcategoria(martillo, manuales).
subcategoria(destornillador, manuales).
subcategoria(sierra, manuales).
subcategoria(taladro, electricas).
subcategoria(llave_inglesa, manuales).
subcategoria(amoladora, electricas).
subcategoria(cinta_metrica, manuales).
subcategoria(soldador, electricas).
subcategoria(cepillo_jardin, jardin).
subcategoria(pala, jardin).
subcategoria(rastrillo, jardin).
subcategoria(motosierras, jardin).
subcategoria(bordeadoras, jardin).
subcategoria(desmalezadora, jardin).
subcategoria(sopladora, jardin).
subcategoria(cortadora_de_cesped, jardin).
subcategoria(taladro_perforador, electricas).
subcategoria(sierra_circular, electricas).
subcategoria(lija_electrica, electricas).
subcategoria(pistola_pintar, electricas).
subcategoria(pinza, manuales).
subcategoria(ganzua, manuales).
subcategoria(morsa, manuales).
subcategoria(serrucho, manuales).
subcategoria(sierra_cinta, electricas).
subcategoria(linterna, manuales).
subcategoria(destornillador_angular, manuales).
subcategoria(pinzas_corte, manuales).
subcategoria(lijadora_orbital, electricas).

%gama de las marcas
gamamarca(bremen, gama_alta).
gamamarca(crossmaster, gama_media).
gamamarca(truper, gama_media).
gamamarca(bahco, gama_alta).
gamamarca(hamilton, gama_baja).
gamamarca(harden, gama_media).
gamamarca(total, gama_baja).
gamamarca(ruhlmann, gama_baja).
gamamarca(bulit, gama_baja).

%marcas de los productos
marcaproducto(martillo, bremen).
marcaproducto(destornillador, crossmaster).
marcaproducto(sierra, truper).
marcaproducto(taladro, bahco).
marcaproducto(llave_inglesa, hamilton).
marcaproducto(amoladora, harden).
marcaproducto(cinta_metrica, total).
marcaproducto(soldador, ruhlmann).
marcaproducto(cepillo_jardin, bremen).
marcaproducto(pala, crossmaster).
marcaproducto(rastrillo, truper).
marcaproducto(motosierras, bahco).
marcaproducto(bordeadoras, hamilton).
marcaproducto(desmalezadora, harden).
marcaproducto(sopladora, total).
marcaproducto(cortadora_de_cesped, ruhlmann).
marcaproducto(taladro_perforador, bulit).
marcaproducto(sierra_circular, bulit).
marcaproducto(lija_electrica, bulit).
marcaproducto(pistola_pintar, bulit).
marcaproducto(pinza, bremen).
marcaproducto(ganzua, crossmaster).
marcaproducto(morsa, truper).
marcaproducto(serrucho, hamilton).
marcaproducto(sierra_cinta, ruhlmann).
marcaproducto(linterna, bremen).
marcaproducto(destornillador_angular, bulit).
marcaproducto(pinzas_corte, crossmaster).
marcaproducto(lijadora_orbital, bahco).

% Hechos que definen la categoría principal para cada herramienta
categoriaprincipal(martillo, herramientas).
categoriaprincipal(destornillador, herramientas).
categoriaprincipal(sierra, herramientas).
categoriaprincipal(taladro, herramientas).
categoriaprincipal(llave_inglesa, herramientas).
categoriaprincipal(amoladora, herramientas).
categoriaprincipal(cinta_metrica, herramientas).
categoriaprincipal(soldador, herramientas).
categoriaprincipal(cepillo_jardin, herramientas).
categoriaprincipal(pala, herramientas).
categoriaprincipal(rastrillo, herramientas).
categoriaprincipal(motosierras, herramientas).
categoriaprincipal(bordeadoras, herramientas).
categoriaprincipal(desmalezadora, herramientas).
categoriaprincipal(sopladora, herramientas).
categoriaprincipal(cortadora_de_cesped, herramientas).
categoriaprincipal(taladro_perforador, herramientas).
categoriaprincipal(sierra_circular, herramientas).
categoriaprincipal(lija_electrica, herramientas).
categoriaprincipal(pistola_pintar, herramientas).
categoriaprincipal(pinza, herramientas).
categoriaprincipal(ganzua, herramientas).
categoriaprincipal(morsa, herramientas).
categoriaprincipal(serrucho, herramientas).
categoriaprincipal(sierra_cinta, herramientas).
categoriaprincipal(linterna, herramientas).
categoriaprincipal(destornillador_angular, herramientas).
categoriaprincipal(pinzas_corte, herramientas).
categoriaprincipal(lijadora_orbital, herramientas).

%
herramientas_en_categoria(Categoria,Herramientas) :-
    findall(Herramienta,subcategoria(Herramienta,Categoria),Herramientas).

% Regla para obtener una lista de marcas de cierta gama
marcas_en_gama(Gama, Marcas) :-
    findall(Marca, gamamarca(Marca, Gama), Marcas).

% Regla para obtener una lista de herramientas de cierta marca
herramientas_en_marca(Marca, Herramientas) :-
    findall(Herramienta, marcaproducto(Herramienta, Marca), Herramientas).

% Regla para obtener la categoría de una herramienta dada
categoria_de_herramienta(Herramienta, Categoria) :-
    subcategoria(Herramienta, Categoria).

