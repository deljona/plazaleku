class Parking {
  final int plazasRotatorias;
  final int plazasResidentesLibres;
  final int plazasResidentes;
  final String libres;
  final String nombre;
  final List<String> precios;

  const Parking({
    required this.plazasRotatorias,
    required this.plazasResidentesLibres,
    required this.plazasResidentes,
    required this.libres,
    required this.nombre,
    required this.precios,
  });

  factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        plazasRotatorias: json["plazasRotatorias"],
        plazasResidentesLibres: json["plazasResidentesLibres"],
        libres: json["libres"],
        nombre: json["nombre"],
        precios: List<String>.from(json["precios"].map((x) => x)),
        plazasResidentes: json["plazasResidentes"],
      );
}
