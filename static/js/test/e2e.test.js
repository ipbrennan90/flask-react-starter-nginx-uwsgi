import puppeteer from 'puppeteer'

const appUrl = 'http://localhost:3000'

let browser
let page

const testServer = async page => {
  try {
    await page.goto(`${appUrl}/`)
  } catch (e) {
    setTimeout(() => testServer(page), 1000)
  }
  return
}
beforeAll(async () => {
  browser = await puppeteer.launch({})
  page = await browser.newPage()
})

describe('renders', () => {
  test('heading', async () => {
    jest.setTimeout(100000)
    await testServer(page)
    await page.waitForSelector('h1')
    const result = await page.evaluate(() => {
      return document.querySelector('h1').innerText
    })

    expect(result).toEqual('Ian-Brennan')
  })
})

afterAll(() => {
  browser.close()
})
