import { VersionInfo } from '@start9labs/start-sdk'

export const current = VersionInfo.of({
  version: '#pow:0.4.1:27',
  releaseNotes: {
    en_US: "Build Blockvase datum_gateway master ce1691739d39916c10a8eb5b8836346c1829e8ea. SHA256d coinbase classes and the NiceHash difficulty floor are removed."
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
