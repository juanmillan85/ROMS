package uk.org.rbc1b.roms.db.circuit;

import uk.org.rbc1b.roms.db.DefaultAuditable;
import uk.org.rbc1b.roms.db.Person;

/**
 * @author oliver.elder.esq
 */
public class Circuit extends DefaultAuditable {

    private String name;
    private Integer circuitId;
    private Person circuitOverseer;

    public Integer getCircuitId() {
        return circuitId;
    }

    public void setCircuitId(Integer circuitId) {
        this.circuitId = circuitId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Person getCircuitOverseer() {
        return circuitOverseer;
    }

    public void setCircuitOverseer(Person circuitOverseer) {
        this.circuitOverseer = circuitOverseer;
    }

    @Override
    public String toString() {
        return "Circuit{" + "circuitId=" + circuitId + '}';
    }
}
