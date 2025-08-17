/**
 * Wait for a given number of milliseconds
 * @param {number} ms 
 * @returns {Promise<void>}
 */
export default function wait(ms = 1000) {
  return Promise.resolve(resolve => setTimeout(resolve, ms))
}