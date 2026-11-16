# 本机网页变慢排查

## 结论

网页先快后慢的主因是 `istone.cc/design` 内嵌的果合游戏。

页面打开后不久会加载约 8MB 的 `fruit-goo-playground.html`。
游戏一加载就以 120Hz 跑物理循环。
本机 CPU 被占满后，再开网页会变慢。

## 修复

已在 `uckkk/my-knowledge-base` 修复：

- 设计页改为按钮按需加载游戏
- 游戏需点击「开始」后才跑循环
- 离开视口或切走标签时暂停
- 物理频率改为 60Hz

## 本机附加项

Cloud Agent 桌面里 `xfwm4` 开了合成。
日志有 `Unsupported GL renderer (llvmpipe)`。
合成在无硬件加速时会加重卡顿。

运行：

```bash
bash scripts/disable-compositing.sh
```
