import { VersionInfo } from '@start9labs/start-sdk'

export const current = VersionInfo.of({
  version: '#pow:0.4.1:26',
  releaseNotes: {
    en_US: "Build Blockvase datum_gateway master 3ee90cb523ba37456bd9eaf19b1560bf6635349e. Pooled mining now defaults to pool.blockvase.com."
  },
  migrations: {
    up: async ({ effects }) => {},
    down: async ({ effects }) => {},
    other: {
        ['*']: {
            up: async ({ effects }) => {},
        }
    }
  },
})
