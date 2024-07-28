import dataPreferences from '@ohos.data.preferences';
//获取token
export const getToken: Function = async () => {
  try {
    let preferences: dataPreferences.Preferences = await globalThis.getPreferences()
    return preferences.getSync('token', '')
  }
  catch (e) {
  }
  return ''
}

//设置token并本地持久化存储
export const setToken: Function = async (value: string) => {
  try {
    let preferences: dataPreferences.Preferences = await globalThis.getPreferences()
    preferences.putSync('token', encodeURIComponent(value))
    await preferences.flush()
  }
  catch (e) {
    console.log(JSON.stringify(e), 'e')
  }
}
