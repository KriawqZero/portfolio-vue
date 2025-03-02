<!-- src/components/HistoricoProfissional.vue -->
<script setup>
const experiencias = [
  {
    titulo: 'Desenvolvedor Autônomo',
    periodo: '2017 - Presente',
    detalhes: [
      'Desenvolvimento e manutenção de 3+ sistemas full-stack',
      'Implementação de soluções completas desde protótipo até deploy',
      'Colaboração em projetos open source',
    ],
    tech: ['Laravel', 'Vue.js', 'Node.js', 'DevOps', 'Docker'],
  },
]
</script>

<template>
  <section class="container mx-auto px-6 py-16 animate-scroll opacity-0 translate-y-8">
    <div class="max-w-4xl mx-auto">
      <h2 class="text-3xl font-bold text-center mb-12 text-indigo-600 dark:text-indigo-400">
        Trajetória de Aprendizado
      </h2>

      <!-- Linha do Tempo -->
      <div class="relative">
        <div
          class="absolute left-1/2 w-1 bg-indigo-100 dark:bg-gray-700 h-full transform -translate-x-1/2"
        ></div>

        <div
          v-for="(exp, index) in experiencias"
          :key="index"
          class="mb-12 flex flex-col md:flex-row items-center"
          :class="index % 2 === 0 ? 'md:flex-row-reverse' : ''"
        >
          <div class="md:w-1/2 p-6">
            <div class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg">
              <h3 class="text-xl font-bold mb-2 text-gray-800 dark:text-white">{{ exp.titulo }}</h3>
              <p class="text-sm text-indigo-600 dark:text-indigo-400 mb-4">{{ exp.periodo }}</p>
              <ul class="space-y-2 mb-4">
                <li
                  v-for="(detalhe, i) in exp.detalhes"
                  :key="i"
                  class="flex items-center text-gray-600 dark:text-gray-300"
                >
                  <i class="bx bx-check-circle text-indigo-600 dark:text-indigo-400 mr-2"></i>
                  {{ detalhe }}
                </li>
              </ul>
              <div class="flex flex-wrap gap-2">
                <span
                  v-for="(tech, t) in exp.tech"
                  :key="t"
                  class="px-3 py-1 bg-indigo-100 dark:bg-gray-700 text-indigo-600 dark:text-indigo-400 rounded-full text-sm"
                >
                  {{ tech }}
                </span>
              </div>
            </div>
          </div>
          <div class="md:w-1/2 p-6 flex justify-center">
            <div
              class="w-16 h-16 bg-indigo-600 text-white rounded-full flex items-center justify-center text-2xl"
            >
              {{ index + 1 }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
