<!-- src/App.vue -->
<script setup>
import { ref, onMounted } from 'vue'
import SobreMim from './components/SobreMim.vue'
import HistoricoProfissional from './components/HistoricoProfissional.vue'
import ThemeToggle from './components/ThemeToggle.vue'

// Estado do tema
const darkMode = ref(false)
// Estado do modal
const showContact = ref(false)

// Dados dos projetos
const projects = ref([
  {
    title: 'Sistema de Gestão de Certificados IFMS',
    description: 'Solução full-stack para automação de processos acadêmicos',
    tech: ['Laravel 11', 'Tailwind CSS', 'Alpine.js', 'MariaDB'],
    repo: 'https://github.com/KriawqZero/IFMS-Sistema_CargaHoraria',
    case: '#',
    impact: 'Redução de 80% no tempo de emissão de documentos',
  },
])

// Habilidades técnicas
const skills = ref([
  { name: 'PHP/Laravel', level: 'Avançado' },
  { name: 'JavaScript/TS', level: 'Avançado' },
  { name: 'Vue/React', level: 'Intermediário' },
  { name: 'Node.js', level: 'Intermediário' },
  { name: 'MariaDB/MySQL/PostgreSQL', level: 'Intermediário' },
  { name: 'Clean Code', level: 'Básico' },
])

// Configurar tema ao carregar
onMounted(() => {
  // Animação de scroll
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('opacity-100', 'translate-y-0')
        }
      })
    },
    { threshold: 0.1 },
  )

  document.querySelectorAll('.animate-scroll').forEach((el) => observer.observe(el))
})

// Controle do modal
const openModal = () => (showContact.value = true)
const closeModal = () => (showContact.value = false)
</script>

<template>
  <!-- No template principal -->
  <div
    class="min-h-screen bg-white dark:bg-gray-900 transition-colors duration-300 relative overflow-hidden"
  >
    <!-- Fundo Global -->
    <div class="fixed inset-0 z-0">
      <div
        class="absolute inset-0 bg-gradient-to-br from-indigo-50/50 via-purple-50/30 to-blue-50/20 dark:from-gray-900 dark:via-gray-800/90 dark:to-gray-900"
      ></div>
      <div
        class="absolute inset-0 bg-[radial-gradient(circle_at_center,_var(--tw-gradient-stops))] from-indigo-200/20 via-transparent to-transparent dark:from-indigo-900/5 dark:via-gray-900/30"
      ></div>
      <div class="absolute inset-0 animate-grid opacity-[3%] dark:opacity-[2%]">
        <div
          class="h-full w-full bg-[length:80px_80px] bg-grid-indigo-500 dark:bg-grid-indigo-900"
        ></div>
      </div>
      <div class="absolute inset-0 bg-noise opacity-10 dark:opacity-5"></div>
    </div>

    <ThemeToggle />

    <div class="relative z-10">
      <!-- Seção Hero -->
      <section class="container mx-auto px-6 py-24 text-center relative overflow-hidden">
        <div class="relative z-10 max-w-5xl mx-auto flex flex-col md:flex-row items-center gap-12">
          <!-- Container da Foto -->
          <div class="relative group md:w-1/3">
            <div
              class="absolute inset-0 bg-gradient-to-r from-indigo-600 to-purple-600 rounded-full blur-xl opacity-30 group-hover:opacity-50 transition-all duration-500 animate-pulse"
            ></div>
            <img
              src="./assets/marcilio.jpg"
              alt="Marcilio Ortiz"
              class="relative w-64 h-64 md:w-80 md:h-80 rounded-full object-cover border-8 border-white dark:border-gray-900 shadow-2xl mx-auto transform transition-all duration-500 hover:scale-105 hover:rotate-3"
            />
            <div
              class="absolute inset-0 rounded-full border-4 border-transparent group-hover:border-indigo-400/30 mix-blend-multiply dark:mix-blend-screen transition-all duration-300"
            ></div>
          </div>

          <!-- Texto -->
          <div
            class="md:w-2/3 text-left space-y-6 animate-scroll opacity-0 translate-y-8 transition-all duration-500"
          >
            <h1
              class="text-5xl md:text-6xl font-bold bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent"
            >
              Marcilio Ortiz
            </h1>
            <p class="text-xl text-gray-600 dark:text-gray-300">
              Desenvolvedor Full Stack · Estudante de Sistemas de Informação
            </p>
          </div>

        </div>
      </section>

      <SobreMim />
      <HistoricoProfissional />

      <!-- Projetos -->
      <section class="container mx-auto px-6 py-16">
        <h2
          class="text-3xl font-bold text-center mb-12 text-gray-800 dark:text-white animate-scroll opacity-0 translate-y-8"
        >
          Projetos Destacados
        </h2>

        <div class="grid md:grid-cols-2 gap-8">
          <div
            v-for="(project, index) in projects"
            :key="index"
            class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg hover:shadow-xl transition-all animate-scroll opacity-0 translate-y-8"
            :style="`transition-delay: ${index * 150}ms`"
          >
            <h3 class="text-xl font-bold mb-2 text-gray-800 dark:text-white">
              {{ project.title }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300 mb-4">
              {{ project.description }}
            </p>
            <div class="flex flex-wrap gap-2 mb-4">
              <span
                v-for="(tech, techIndex) in project.tech"
                :key="techIndex"
                class="px-3 py-1 bg-indigo-100 dark:bg-gray-700 text-indigo-600 dark:text-indigo-400 rounded-full text-sm"
              >
                {{ tech }}
              </span>
            </div>
            <p class="text-sm text-indigo-600 dark:text-indigo-400 mb-4">
              <i class="bx bx-star mr-2"></i>{{ project.impact }}
            </p>
            <div class="flex gap-3">
              <a
                :href="project.repo"
                class="flex-1 bg-indigo-600 text-white py-2 px-4 rounded-lg text-center hover:bg-indigo-700 transition-colors"
              >
                Repositório
              </a>
            </div>
          </div>
        </div>
      </section>

      <!-- Habilidades -->
      <section class="container mx-auto px-6 py-16">
        <h2
          class="text-3xl font-bold text-center mb-12 text-gray-800 dark:text-white animate-scroll opacity-0 translate-y-8"
        >
          Competências Técnicas
        </h2>

        <div class="grid md:grid-cols-3 gap-6">
          <div
            v-for="(skill, index) in skills"
            :key="index"
            class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-md hover:shadow-lg transition-all animate-scroll opacity-0 translate-y-8"
            :style="`transition-delay: ${index * 50}ms`"
          >
            <div class="flex items-center justify-between mb-4">
              <span class="text-gray-600 dark:text-gray-300 font-medium">{{ skill.name }}</span>
              <span
                class="text-sm px-2 py-1 bg-indigo-100 dark:bg-gray-700 text-indigo-600 dark:text-indigo-400 rounded-full"
              >
                {{ skill.level }}
              </span>
            </div>
            <div class="h-2 bg-gray-100 dark:bg-gray-700 rounded-full">
              <div
                class="h-full bg-indigo-600 rounded-full transition-all duration-1000"
                :class="{
                  'w-4/5': skill.level === 'Avançado',
                  'w-3/5': skill.level === 'Intermediário',
                  'w-2/5': skill.level === 'Básico',
                }"
              ></div>
            </div>
          </div>
        </div>
      </section>

      <!-- Contato Flutuante -->
      <div class="fixed bottom-8 right-8 z-50 group">
        <div
          class="flex items-center gap-4 bg-white dark:bg-gray-800 rounded-full shadow-2xl p-4 pr-6 border border-gray-200 dark:border-gray-700 transition-all duration-500 hover:shadow-lg hover:scale-105"
        >
          <!-- Email Principal -->
          <a
            href="mailto:contato@marcilio.dev.br"
            class="flex items-center gap-2 text-gray-600 dark:text-gray-300 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors"
          >
            <div class="p-3 bg-indigo-100 dark:bg-gray-700 rounded-full">
              <i class="bx bx-envelope text-indigo-600 dark:text-indigo-400 text-xl"></i>
            </div>
            <span class="font-medium">contato@marcilio.dev.br</span>
          </a>

          <!-- Divisor -->
          <div class="h-8 w-px bg-gray-200 dark:bg-gray-600 mx-2"></div>

          <!-- Redes Sociais -->
          <div class="flex gap-3">
            <a
              href="https://www.linkedin.com/in/marc%C3%ADlio-ortiz-barbosa-7b5a35165/"
              class="p-3 bg-indigo-600 text-white rounded-full hover:bg-indigo-700 transition-all duration-300 hover:rotate-12"
            >
              <i class="bx bxl-linkedin text-xl"></i>
            </a>
            <a
              href="https://github.com/KriawqZero"
              class="p-3 bg-gray-800 dark:bg-gray-700 text-white rounded-full hover:bg-gray-700 dark:hover:bg-gray-600 transition-all duration-300 hover:rotate-12"
            >
              <i class="bx bxl-github text-xl"></i>
            </a>
            <a
              href="https://api.whatsapp.com/send?phone=5567984079762"
              class="p-3 bg-green-600 text-white rounded-full hover:bg-green-700 transition-all duration-300 hover:rotate-12"
            >
              <i class="bx bxl-whatsapp text-xl"></i>
            </a>
          </div>
        </div>

        <!-- Balão decorativo -->
        <div
          class="absolute -top-4 -right-4 bg-indigo-600 text-white px-3 py-1 rounded-full text-sm shadow-lg transform scale-0 group-hover:scale-100 transition-transform"
        >
          Vamos conversar?
        </div>
      </div>

      <!-- Footer -->
      <footer class="bg-gray-100 dark:bg-gray-800 mt-16 py-8">
        <div class="container mx-auto px-6 text-center">
          <p class="text-gray-600 dark:text-gray-300 text-sm">
            © 2025 Marcilio Ortiz.<br />
            Desenvolvido com Vue.js, Tailwind CSS.
          </p>
        </div>
      </footer>
    </div>
  </div>
</template>

<style>
.bg-noise {
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 1000 1000' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.65' numOctaves='3' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
}

@keyframes grid-move {
  from {
    background-position: 0 0;
  }
  to {
    background-position: 80px 80px;
  }
}

.animate-grid {
  animation: grid-move 40s linear infinite;
}

@keyframes blob-float {
  0%,
  100% {
    transform: translateY(0) rotate(0deg);
  }
  50% {
    transform: translateY(-20px) rotate(2deg);
  }
}

.group:hover img {
  animation: blob-float 3s ease-in-out infinite;
}
@keyframes fade-in {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.animate-scroll {
  animation: fade-in 0.6s ease forwards;
}

.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-active .modal-content,
.modal-leave-active .modal-content {
  transition: all 0.3s ease;
}

.modal-enter-from .modal-content,
.modal-leave-to .modal-content {
  transform: translateY(-20px);
  opacity: 0;
}

.bx {
  display: inline-block;
  font-family: 'boxicons' !important;
  font-style: normal;
}
</style>
