package org.iesbelen.dto;

import org.iesbelen.model.Fabricante;

import java.util.List;
import java.util.Optional;

public class FabricanteDTO extends Fabricante {
    private Integer cantProductos;

    public FabricanteDTO(Integer idFabricante, String nombre, Integer cantProductos){
        this.setIdFabricante(idFabricante);
        this.setNombre(nombre);
        this.setCantProductos(cantProductos);
    }

    public FabricanteDTO(Fabricante fabricante, Integer cantProductos) {
        this.setIdFabricante(fabricante.getIdFabricante());
        this.setNombre(fabricante.getNombre());
        this.cantProductos = cantProductos;
    }

    public Integer getCantProductos() {
        return cantProductos;
    }

    public void setCantProductos(Integer cantProductos) {
        this.cantProductos = cantProductos;
    }
}
