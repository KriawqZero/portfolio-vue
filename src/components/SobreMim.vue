<!-- src/components/SobreMim.vue -->
<script setup>
const sobre = {
  formacao: {
    curso: 'Sistemas de Informação',
    instituicao: 'UFMS',
    periodo: '2025 - Presente',
  },
  formacaoTecnica: {
    curso: 'Técnico em Informática',
    instituicao: 'IFMS',
    periodo: '2022 - 2024',
    tcc: {
      titulo: 'Sistema de Gestão de Certificados',
      descricao: 'Plataforma full-stack para automação de processos acadêmicos',
      tecnologias: ['Laravel 11', 'MariaDB', 'TailwindCSS', 'AlpineJS'],
      impacto: 'Adoção institucional com mais de 1.000 usuários ativos',
    },
  },
  habilidades: [
    'Desenvolvimento Full Stack',
    'Arquitetura de Sistemas Web',
    'Integração de APIs Complexas',
    'Otimização de Performance',
  ],
  trajetoria:
    'Comecei a programar aos 11 anos com Python e desde então desenvolvi mais de 30 projetos sendo autodidata.',
}
</script>

<template>
  <section class="container mx-auto px-6 py-16 animate-scroll opacity-0 translate-y-8">
    <div class="max-w-4xl mx-auto bg-white dark:bg-gray-800 rounded-2xl shadow-xl p-8">
      <h2 class="text-3xl font-bold text-indigo-600 dark:text-indigo-400 mb-8">
        Minha Jornada Tecnológica
      </h2>

      <div class="grid md:grid-cols-2 gap-8">
        <!-- Coluna Esquerda -->
        <div class="space-y-6">
          <!-- Formação Acadêmica -->
          <div class="bg-indigo-50 dark:bg-gray-700 p-6 rounded-xl">
            <h3 class="text-xl font-semibold mb-4 text-gray-800 dark:text-white">
              Formação Acadêmica
            </h3>
            <div class="space-y-4">
              <!-- Graduação -->
              <div>
                <p class="text-indigo-600 dark:text-indigo-400 font-medium">
                  {{ sobre.formacao.curso }}
                </p>
                <p class="text-gray-600 dark:text-gray-300">{{ sobre.formacao.instituicao }}</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">
                  {{ sobre.formacao.periodo }}
                </p>
              </div>

              <!-- Formação Técnica -->
              <div class="pt-4 border-t border-indigo-100 dark:border-gray-600">
                <p class="text-indigo-600 dark:text-indigo-400 font-medium">
                  {{ sobre.formacaoTecnica.curso }}
                </p>
                <p class="text-gray-600 dark:text-gray-300">
                  {{ sobre.formacaoTecnica.instituicao }}
                </p>
                <p class="text-sm text-gray-500 dark:text-gray-400">
                  {{ sobre.formacaoTecnica.periodo }}
                </p>
                <div class="mt-3">
                  <p class="text-sm font-medium text-gray-800 dark:text-gray-200">TCC Destaque:</p>
                  <ul
                    class="list-disc list-inside text-gray-600 dark:text-gray-400 text-sm space-y-1 mt-1"
                  >
                    <li>{{ sobre.formacaoTecnica.tcc.titulo }}</li>
                    <li>Tecnologias: {{ sobre.formacaoTecnica.tcc.tecnologias.join(', ') }}</li>
                    <li>{{ sobre.formacaoTecnica.tcc.impacto }}</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Habilidades -->
          <div class="bg-indigo-50 dark:bg-gray-700 p-6 rounded-xl">
            <h3 class="text-xl font-semibold mb-4 text-gray-800 dark:text-white">
              Principais Habilidades
            </h3>
            <ul class="space-y-3">
              <li
                v-for="(habilidade, index) in sobre.habilidades"
                :key="index"
                class="flex items-center text-gray-600 dark:text-gray-300"
              >
                <i class="bx bx-chevron-right text-indigo-600 dark:text-indigo-400 mr-2"></i>
                {{ habilidade }}
              </li>
            </ul>
          </div>
        </div>

        <!-- Coluna Direita -->
        <div class="space-y-6">
          <div class="relative h-full">
            <div class="absolute inset-0 bg-indigo-100 dark:bg-gray-700 rounded-xl"></div>
            <div class="relative p-6 h-full flex items-center">
              <p class="text-lg text-gray-600 dark:text-gray-300 leading-relaxed">
                {{ sobre.trajetoria }}
                <span class="block mt-4 font-medium text-indigo-600 dark:text-indigo-400">
                  "Transformo problemas em solução em linhas de codigo"
                </span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
