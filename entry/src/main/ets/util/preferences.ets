// import { preferences } from '@kit.ArkData'
// import { Context } from '@kit.AbilityKit'

import preferences from '@ohos.data.preferences';
import common from '@ohos.app.ability.common';

interface ListContent {
  index: number
  title: string
  content: string
}

class PreferencesUtils {
  prefMap: Map<string, preferences.Preferences> = new Map()

  // 加载数据load
  async loadPreference(context:common.UIAbilityContext, name: string) {
    try {
      const pref = await preferences.getPreferences(context, name)
      this.prefMap.set(name, pref)
      console.log('testTag', `加载preferences[${name}]成功`)
    }
    catch (e) {
      console.log('testTag', `加载preferences[${name}]失败`, JSON.stringify(e));
    }
  }

  // 读取该库的全部内容
  async getPreference(name: string) {
    // 先判断是否存在该名称的键值对
    if (!this.prefMap.has(name)) {
      console.log('testTag 该库内容读取失败', `preferences[${name}]不存在`);
      return
    }
    try {
      const pref = this.prefMap.get(name) as preferences.Preferences
      console.log('testTag', `读取preferences[${name}]成功`)
      return pref
    }
    catch (e) {
      console.log('testTag', `读取preferences[${name}]失败`, JSON.stringify(e));
    }
    return
  }

  // 新增数据put
  async putPreferenceValue(name: string, key: string, value: preferences.ValueType) {
    // 先判断是否存在该名称的键值对
    if (!this.prefMap.has(name)) {
      console.log('testTag 新增失败', `preferences[${name}]尚未初始化`);
      return
    }
    try {
      const pref = this.prefMap.get(name) as preferences.Preferences
      // 写入数据
      await pref.put(key, value)
      // 刷盘
      await pref.flush()
      console.log('testTag', `保存preferences[${name}]成功`)
    }

    catch (e) {
      console.log('testTag', `保存preferences[${name}]失败`, JSON.stringify(e));
    }
  }

  // 读取数据get
  async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType) {
    // 先判断是否存在该名称的键值对
    if (!this.prefMap.has(name)) {
      console.log('testTag 读取失败', `preferences[${name}]尚未初始化`);
      return
    }
    try {
      const pref = this.prefMap.get(name) as preferences.Preferences
      const value = await pref.get(key, defaultValue) as string
      console.log('testTag', `读取preferences[${name}.${key}=${value}]成功`)
      return JSON.parse(value)
    }
    catch (e) {
      console.log('testTag', `读取preferences[${name}]失败`, JSON.stringify(e));
    }
    return
  }

  // 删除数据del
  async delPreferenceValue(name: string, key: string) {
    // 先判断是否存在该名称的键值对
    if (!this.prefMap.has(name)) {
      console.log('testTag 删除失败', `preferences[${name}]尚未初始化`);
      return
    }
    try {
      const pref = this.prefMap.get(name)  as preferences.Preferences
      await pref.delete(key)
      // 删除后也要刷盘，保证持久化
      await pref.flush()
      console.log('testTag', `删除preferences[${name}.${key}]成功`)
    }
    catch (e) {
      console.log('testTag', `删除preferences[${name}.${key}]失败`, JSON.stringify(e));
    }
  }

  // 删除该库
  async delPreference(name: string) {
    // 先判断是否存在该名称的键值对
    if (!this.prefMap.has(name)) {
      console.log('testTag 删除库失败', `preferences[${name}]尚未初始化`);
      return
    }
    try {
      this.prefMap.delete(name)
      console.log('testTag', `删除库[${name}]成功`)
    }
    catch (e) {
      console.log('testTag', `删除库[${name}]失败`, JSON.stringify(e));
    }
  }
}

const preferenceUtils = new PreferencesUtils()

export default preferenceUtils as PreferencesUtils