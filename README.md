# Automotive-Networks
# HW2
# CRC-15 CAN Simulation in VHDL

## Descripción

Este proyecto implementa en **VHDL** el cálculo del **CRC-15** utilizado en redes **CAN (Controller Area Network)**. La simulación se desarrolla en [EDA Playground](https://www.edaplayground.com/) u otras herramientas como **ModelSim** o **Vivado**.

El objetivo es obtener el residuo (`R`) al dividir una cadena de datos `D` de 20 bits entre un polinomio generador `G` de 16 bits, correspondiente al estándar CRC-15 en CAN.

## Especificaciones

- **Entrada `D`**: Cadena de datos de 20 bits.  
- **Entrada `G`**: Polinomio generador de 16 bits.  
- **Salida `R`**: Resultado del residuo CRC de 15 bits.  
- **Polinomio usado**: G(X) =  x^15 + x^14 + x^10 + x^8 + x^7 + x^4 + x^3 + 1
- 
- ## Uso

1. Abrir ambos archivos en EDA Playground o tu simulador VHDL preferido.
2. Ejecutar la simulación desde el testbench.
3. Observar la salida `residue_out`, que contiene el CRC calculado.

-----

# HW3

# CANoe ECU Simulation with CAPL

## Descripción

Este proyecto simula nodos ECU en una red CAN utilizando **CANoe** y el lenguaje **CAPL**, permitiendo el control y monitoreo de diversas funciones de un automóvil, como:

- Encendido del motor
- Bloqueo y desbloqueo de puertas
- Subida y bajada de ventanas
- Sistema de intermitentes (luces direccionales y alarma)

## Funcionalidades principales

- 🧩 Simulación de múltiples nodos ECU (Main Control, Doors, Indicators)
- 🎛️ Creación de paneles interactivos para control de funciones del auto
- 📡 Configuración de mensajes y señales CAN
- 🧠 Programación en CAPL basada en eventos y temporizadores
- 🗃️ Generación y edición de base de datos CANdb++
