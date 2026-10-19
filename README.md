# AURA AUDIO — Landing Page Cinemática

Experiencia web interactiva para los auriculares de alta fidelidad **AURA AUDIO**, construida con **Astro 5**, **Svelte 5 (Runes)** y **Tailwind CSS v4**.

## Características Principales

1. **Hero Cinemático en Video Loop:**
   - Video de fondo optimizado con fallback instantáneo a imagen WebP.
   - Modo inmersivo ("Ver video") que despeja la tipografía para admirar la escena.
   - Navegación superior y botón de llamado a la acción con scroll suave.

2. **Calibración Acústica Interactiva:**
   - Selector reactivo de perfiles de audio (ANC Máximo, Modo Estudio, Extensión Graves).
   - Espectro dinámico ecualizador en tiempo real mediante Svelte 5 `$derived`.
   - Control deslizante interactivo de atenuación sonora (0 dB a -42 dB).

3. **Scrollytelling 60 FPS por Canvas:**
   - Secuencia de 120 fotogramas WebP precargados progresivamente.
   - Sincronización precisa con el desplazamiento (`position: sticky`).
   - Fallback de imagen en el primer fotograma para evitar parpadeos negros.
   - Micro-interacciones de dos estados por fase acústica y ergonómica.

4. **Pie de Página Técnico Integrado:**
   - Superpuesto directamente sobre el fotograma final del gorila sin cortar su silueta.
   - Cuadrícula de especificaciones técnicas (Arquitectura acústica, Conectividad, Batería, Materiales).
   - Botón de retorno al inicio.

5. **Compatibilidad Multi-Navegador y Responsividad Total:**
   - 100% responsivo en Mobile (375px - 430px), Tablet (768px - 1024px) y Desktop (1440px+).
   - Verificado contra desbordamiento horizontal (`scrollWidth <= clientWidth`).
   - Totalmente funcional en Chromium, Firefox (Gecko) y WebKit (Safari).
   - Cumplimiento estricto de las directivas anti-slop definidas en `AGENTS.md`.

---

## Requisitos Previos

- Node.js 18+ o superior.
- Gestor de paquetes `npm` (o `pnpm` / `bun`).

---

## Instalación y Ejecución

```bash
# 1. Instalar dependencias
npm install

# 2. Iniciar servidor de desarrollo local
npm run dev

# 3. Compilar para producción (Typecheck + Astro build)
npm run build

# 4. Previsualizar la compilación de producción
npm run preview
```

---

## Estructura del Proyecto

```
aura-audio/
├── public/
│   ├── frames/gorilla/          # 120 fotogramas WebP de la secuencia
│   ├── images/gorilla-headphones.jpg # Imagen poster de respaldo
│   ├── Gorilla_turning_head_1080p_20261018160337.mp4 # Video hero
│   └── favicon.svg              # Favicon vectorial
├── src/
│   ├── components/
│   │   └── AuraHero.svelte      # Componente monolítico interactivo (Svelte 5)
│   └── pages/
│       └── index.astro          # Entrypoint Astro con directivas de cliente
├── astro.config.mjs             # Integración Astro + Svelte + Tailwind
├── package.json                 # Dependencias y scripts
├── tsconfig.json                # Configuración TypeScript
├── AGENTS.md                    # Directivas de diseño y compatibilidad técnica
└── README.md
```

---

## Licencia

Propiedad de **AURA AUDIO © 2026**. Todos los derechos reservados.
